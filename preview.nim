# importing from standard library
import os
import parseopt2

# importing translated header
import "magic.nim"

# ===========
# Entry Point
# ===========

var file_path: string = ""
var display_file_metadata: bool = false

for kind, key, value in parseopt2.getopt():
  case kind
  of cmdLongOption:
    case key
    of "metadata":
      display_file_metadata = true
    else: discard
  of cmdArgument:
    file_path = key
  else: discard

if os.existsFile(file_path):
  if display_file_metadata:
    let magic = magic_open(MAGIC_MIME)
    let result_code = magic_load(magic, nil)
    if result_code == 0:
      let magic_string: cstring = magic_file(magic, file_path)
      echo(magic_string)
    magic_close(magic)
  # now cat the file contents
  let file_handle = open(file_path, fmRead)
  let file_size = getFileSize(file_handle)
  let fifty_mb: int64 = 50*(1024*2)
  let read_size = min(file_size, fifty_mb)
  var file_buffer = newSeq[char](read_size)
  let read_count = readChars(file_handle, file_buffer, 0, read_size)
  close(file_handle)
  for byte in file_buffer:
    write(stdout, byte)
  flushFile(stdout)
elif os.existsDir(file_path):
  for kind, path in os.walkDir(file_path):
    echo(path)
else:
  echo("Unable to access path!")
  quit(QuitFailure)

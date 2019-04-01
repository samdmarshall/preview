mode = ScriptMode.Verbose

import ospaths

var prefix =
  if findExe("brew").len > 0: gorge("brew --prefix")
  else: "/usr"

switch("cincludes", prefix / "include")
switch("clibdir", prefix / "lib")
#switch("clib", "magic")

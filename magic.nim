## 
##  Copyright (c) Christos Zoulas 2003.
##  All Rights Reserved.
## 
##  Redistribution and use in source and binary forms, with or without
##  modification, are permitted provided that the following conditions
##  are met:
##  1. Redistributions of source code must retain the above copyright
##     notice immediately at the beginning of the file, without modification,
##     this list of conditions, and the following disclaimer.
##  2. Redistributions in binary form must reproduce the above copyright
##     notice, this list of conditions and the following disclaimer in the
##     documentation and/or other materials provided with the distribution.
## 
##  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
##  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
##  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
##  ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
##  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
##  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
##  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
##  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
##  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
##  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
##  SUCH DAMAGE.
## 


{.passL: "-lmagic -L/usr/local/lib".}

const
  MAGIC_NONE* = 0x00000000
  MAGIC_DEBUG* = 0x00000001
  MAGIC_SYMLINK* = 0x00000002
  MAGIC_COMPRESS* = 0x00000004
  MAGIC_DEVICES* = 0x00000008
  MAGIC_MIME_TYPE* = 0x00000010
  MAGIC_CONTINUE* = 0x00000020
  MAGIC_CHECK* = 0x00000040
  MAGIC_PRESERVE_ATIME* = 0x00000080
  MAGIC_RAW* = 0x00000100
  MAGIC_ERROR* = 0x00000200
  MAGIC_MIME_ENCODING* = 0x00000400
  MAGIC_MIME* = (MAGIC_MIME_TYPE or MAGIC_MIME_ENCODING)
  MAGIC_APPLE* = 0x00000800
  MAGIC_EXTENSION* = 0x01000000
  MAGIC_COMPRESS_TRANSP* = 0x02000000
  MAGIC_NODESC* = (MAGIC_EXTENSION or MAGIC_MIME or MAGIC_APPLE)
  MAGIC_NO_CHECK_COMPRESS* = 0x00001000
  MAGIC_NO_CHECK_TAR* = 0x00002000
  MAGIC_NO_CHECK_SOFT* = 0x00004000
  MAGIC_NO_CHECK_APPTYPE* = 0x00008000
  MAGIC_NO_CHECK_ELF* = 0x00010000
  MAGIC_NO_CHECK_TEXT* = 0x00020000
  MAGIC_NO_CHECK_CDF* = 0x00040000
  MAGIC_NO_CHECK_TOKENS* = 0x00100000
  MAGIC_NO_CHECK_ENCODING* = 0x00200000

##  No built-in tests; only consult the magic file

const
  MAGIC_NO_CHECK_BUILTIN* = 
    (MAGIC_NO_CHECK_COMPRESS or MAGIC_NO_CHECK_TAR or MAGIC_NO_CHECK_APPTYPE or MAGIC_NO_CHECK_ELF or MAGIC_NO_CHECK_TEXT or MAGIC_NO_CHECK_CDF or MAGIC_NO_CHECK_TOKENS or MAGIC_NO_CHECK_ENCODING or 0)

##  Defined for backwards compatibility (renamed)

const
  MAGIC_NO_CHECK_ASCII* = MAGIC_NO_CHECK_TEXT

##  Defined for backwards compatibility; do nothing

const
  MAGIC_NO_CHECK_FORTRAN* = 0x00000000
  MAGIC_NO_CHECK_TROFF* = 0x00000000
  MAGIC_VERSION* = 529

type
  magic_t* = ptr object

proc magic_open*(a2: cint): magic_t                                                     {.header: "/usr/local/include/magic.h", importc.}
proc magic_close*(a2: magic_t)                                                          {.header: "/usr/local/include/magic.h", importc.}
proc magic_getpath*(a2: cstring; a3: cint): cstring                                     {.header: "/usr/local/include/magic.h", importc.}
proc magic_file*(a2: magic_t; a3: cstring): cstring                                     {.header: "/usr/local/include/magic.h", importc.}
proc magic_descriptor*(a2: magic_t; a3: cint): cstring                                  {.header: "/usr/local/include/magic.h", importc.}
proc magic_buffer*(a2: magic_t; a3: pointer; a4: csize): cstring                        {.header: "/usr/local/include/magic.h", importc.}
proc magic_error*(a2: magic_t): cstring                                                 {.header: "/usr/local/include/magic.h", importc.}
proc magic_setflags*(a2: magic_t; a3: cint): cint                                       {.header: "/usr/local/include/magic.h", importc.}
proc magic_version*(): cint                                                             {.header: "/usr/local/include/magic.h", importc.}
proc magic_load*(a2: magic_t; a3: cstring): cint                                        {.header: "/usr/local/include/magic.h", importc.}
proc magic_load_buffers*(a2: magic_t; a3: ptr pointer; a4: ptr csize; a5: csize): cint  {.header: "/usr/local/include/magic.h", importc.}
proc magic_compile*(a2: magic_t; a3: cstring): cint                                     {.header: "/usr/local/include/magic.h", importc.}
proc magic_check*(a2: magic_t; a3: cstring): cint                                       {.header: "/usr/local/include/magic.h", importc.}
proc magic_list*(a2: magic_t; a3: cstring): cint                                        {.header: "/usr/local/include/magic.h", importc.}
proc magic_errno*(a2: magic_t): cint                                                    {.header: "/usr/local/include/magic.h", importc.}

const
  MAGIC_PARAM_INDIR_MAX* = 0
  MAGIC_PARAM_NAME_MAX* = 1
  MAGIC_PARAM_ELF_PHNUM_MAX* = 2
  MAGIC_PARAM_ELF_SHNUM_MAX* = 3
  MAGIC_PARAM_ELF_NOTES_MAX* = 4
  MAGIC_PARAM_REGEX_MAX* = 5
  MAGIC_PARAM_BYTES_MAX* = 6

proc magic_setparam*(a2: magic_t; a3: cint; a4: pointer): cint                          {.header: "/usr/local/include/magic.h", importc.}
proc magic_getparam*(a2: magic_t; a3: cint; a4: pointer): cint                          {.header: "/usr/local/include/magic.h", importc.}

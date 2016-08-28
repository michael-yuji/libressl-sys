# libressl-sys

## Description

`libressl-sys` is a system module for linking libressl (libtls) to swift.

Since depends on your OS and install path, the location of headers CAN BE DIFFERENT. 
Therefore, the shell script `conf.sh` can be use to generate a customized module.modulemap for your configuation 

## Install

#### Option1
install your libressl to /usr/local/opt/ than installation is not required.
Your file structure should looks like this

  * /usr/local/opt

    * libressl <--- this is what i mean libressl root

       * include

         * openssl

           *  *.h

         *  tls.h

       * lib
         * *.so (.dylib is OSX)
         * *.a
                  
#### Option2 - use the script after swift build
assume you have added this package to your swift package manager...
```bash
> swift build
> # error, cannot find headers/lib.....
> cd Packages/libressl-0.0.1/ 
> ./conf.sh /path/to/your/libressl
```

## Build and usage

Now you have your module.modulemap ready, in order to build your project, you'll need to tell the linker where to find the libs and where to find the headers:

```bash
> cd /to/your/swift/project
> swift build -Xlinker -L/path/to/libressl/lib -Xcc -I/path/to/libressl/include
```

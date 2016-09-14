# libressl-sys

## Description

`libressl-sys` is a system module for linking libressl (libtls) to swift.

Since depends on your OS and install path, the location of headers CAN BE DIFFERENT. 
Therefore, the shell script `conf.sh` can be use to generate a customized module.modulemap for your configuation 

## Install

To build your project linked to this module, see Build and usage.

#### OS X
```bash
brew install libressl
```
as long as you have libressl installed in default path (/usr/local/opt/libressl/) you should be fine.

#### Linux

install libressl:
```bash
$ wget http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.4.2.tar.gz
$ tar -xzvf libressl-2.4.2.tar.gz
$ cd libressl-2.4.2
$ ./configure
$ make
$ sudo make install
$ sudo ldconfig
```

configure module.modulemap:
```
$ cd /path/2/your/package/Packages/libressl-0.0.2/
$ ./conf.sh /usr/local/
```

#### conf.sh usage:

##### definition
When i mean the root of libressl, i mean the directory contains the `include` and `lib` of libressl headers and libraries

For example on OSX/macOS (install with brew with default setting):
  * /usr/local/opt

    * libressl <--- this

       * include

         * openssl

           *  *.h

         *  tls.h

       * lib
         * *.dylib
         * *.a
                  
on Linux (assuming you followed the instruction from above):
  * /usr/local/  <--- this
       * include

         * openssl

           *  *.h

         *  tls.h

       * lib
         * *.so
         * *.a
                 


Now let's say you installed libressl in different directory, do the following to configure the module.modulemap
```bash
$ cd /path/2/your/package/Packages/libressl-0.0.1/ 
$ ./conf.sh /path/to/your/libressl_root
```

## Build and usage

Now you have your module.modulemap ready, in order to build your project, you'll need to tell the linker where to find the libs and where to find the headers:

```bash
$ cd /to/your/swift/project
$ swift build -Xlinker -L/path/to/libressl_root/lib -Xcc -I/path/to/libressl_root/include
```

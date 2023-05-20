program main

   use :: forgnu

   implicit none

   ! =========================================================================================
   type(package) :: gcc
   type(package) :: gdb
   type(package) :: bash
   type(package) :: make
   type(package) :: binutils
   type(package) :: libtool
   ! =========================================================================================


   ! =========================================================================================
   call gcc%set_name("gcc")
   call gcc%set_version("13.1.0")
   call gcc%set_prereqpackages("")
   call gcc%set_prereqmodules("")
   call gcc%set_configure_options("--enable-languages=c,c++,fortran --enable-host-shared --enable-targets=all")
   call gcc%set_src_dir("/prf/prg/lin/src")
   call gcc%set_install_dir("/prf/prg/lin/src/pth")
   call gcc%set_file_format(".tar.gz")
   call gcc%set_download_link("ftp://ftp.gwdg.de/pub/misc/gcc/releases/gcc-"&
   //gcc%version//"/gcc-"//gcc%version//gcc%file_format)

   call gcc%apt_install()
   call gcc%module_load()
   call gcc%set_src_path()
   call gcc%download()
   call gcc%extract()
   call gcc%prerequisites()
   call gcc%set_build_dir()
   call gcc%make_build_dir()
   call gcc%configure()
   call gcc%build()
   call gcc%install()
   call gcc%dlloc()
   ! =========================================================================================


   ! =========================================================================================
   call gdb%set_name("gdb")
   call gdb%set_version("13.1")
   call gdb%set_prereqpackages("")
   call gdb%set_prereqmodules("")
   call gdb%set_configure_options("--enable-targets=all --enable-tui")
   call gdb%set_src_dir("/prf/prg/lin/src")
   call gdb%set_install_dir("/prf/prg/lin/src/pth")
   call gdb%set_file_format(".tar.gz")
   call gdb%set_download_link("http://ftp.gnu.org/gnu/gdb/gdb-"//gdb%version//gdb%file_format)

   call gdb%apt_install()
   call gdb%module_load()
   call gdb%set_src_path()
   call gdb%download()
   call gdb%extract()
   call gdb%set_build_dir()
   call gdb%make_build_dir()
   call gdb%configure()
   call gdb%build()
   call gdb%install()
   call gdb%dlloc()
   ! =========================================================================================


   ! =========================================================================================
   call bash%set_name("bash")
   call bash%set_version("5.2.15")
   call bash%set_prereqpackages("")
   call bash%set_prereqmodules("")
   call bash%set_configure_options("")
   call bash%set_src_dir("/prf/prg/lin/src")
   call bash%set_install_dir("/prf/prg/lin/src/install/bash")
   call bash%set_file_format(".tar.gz")
   call bash%set_download_link("http://ftp.gnu.org/gnu/bash/bash-"//bash%version//bash%file_format)

   call bash%apt_install()
   call bash%module_load()
   call bash%set_src_path()
   call bash%download()
   call bash%extract()
   call bash%set_build_dir()
   call bash%make_build_dir()
   call bash%configure()
   call bash%build()
   call bash%install()
   call bash%dlloc()
   ! =========================================================================================


   ! =========================================================================================
   call make%set_name("make")
   call make%set_version("4.4.1")
   call make%set_prereqpackages("")
   call make%set_prereqmodules("")
   call make%set_configure_options("")
   call make%set_src_dir("/prf/prg/lin/src")
   call make%set_install_dir("/prf/prg/lin/src/install/make")
   call make%set_file_format(".tar.gz")
   call make%set_download_link("http://ftp.gnu.org/gnu/make/make-"//make%version//make%file_format)

   call make%apt_install()
   call make%module_load()
   call make%set_src_path()
   call make%download()
   call make%extract()
   call make%set_build_dir()
   call make%make_build_dir()
   call make%configure()
   call make%build()
   call make%install()
   call make%dlloc()
   ! =========================================================================================


   ! =========================================================================================
   call binutils%set_name("binutils")
   call binutils%set_version("2.40")
   call binutils%set_prereqpackages("")
   call binutils%set_prereqmodules("")
   call binutils%set_configure_options("")
   call binutils%set_src_dir("/prf/prg/lin/src")
   call binutils%set_install_dir("/prf/prg/lin/src/install/binutils")
   call binutils%set_file_format(".tar.gz")
   call binutils%set_download_link("http://ftp.gnu.org/gnu/binutils/binutils-"//binutils%version//binutils%file_format)

   call binutils%apt_install()
   call binutils%module_load()
   call binutils%set_src_path()
   call binutils%download()
   call binutils%extract()
   call binutils%set_build_dir()
   call binutils%make_build_dir()
   call binutils%configure()
   call binutils%build()
   call binutils%install()
   call binutils%dlloc()
   ! =========================================================================================


   ! =========================================================================================
   call libtool%set_name("libtool")
   call libtool%set_version("2.4.7")
   call libtool%set_prereqpackages("")
   call libtool%set_prereqmodules("")
   call libtool%set_configure_options("")
   call libtool%set_src_dir("/prf/prg/lin/src")
   call libtool%set_install_dir("/prf/prg/lin/src/install/libtool")
   call libtool%set_file_format(".tar.gz")
   call libtool%set_download_link("http://ftp.gnu.org/gnu/libtool/libtool-"//libtool%version//libtool%file_format)

   call libtool%apt_install()
   call libtool%module_load()
   call libtool%set_src_path()
   call libtool%download()
   call libtool%extract()
   call libtool%set_build_dir()
   call libtool%make_build_dir()
   call libtool%configure()
   call libtool%build()
   call libtool%install()
   call libtool%dlloc()
   ! =========================================================================================

end program main

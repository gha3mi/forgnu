program build_gcc

   use :: forgnu

   implicit none

   ! =========================================================================================
   type(package) :: gcc
   type(package) :: gdb
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

end program build_gcc

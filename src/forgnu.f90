!> author: Seyed Ali Ghasemi
module forgnu

   implicit none

   private

   public :: package

   !===============================================================================
   type :: package
      character(len=:), allocatable :: name
      character(len=:), allocatable :: version
      character(len=:), allocatable :: file_format
      character(len=:), allocatable :: download_link
      character(len=:), allocatable :: configure_options
      character(len=:), allocatable :: src_dir
      character(len=:), allocatable :: src_path
      character(len=:), allocatable :: build_dir
      character(len=:), allocatable :: install_dir
      character(len=:), allocatable :: prereqpackages
      character(len=:), allocatable :: prereqmodules
   contains
      procedure :: set_name
      procedure :: set_version
      procedure :: set_file_format
      procedure :: set_download_link
      procedure :: set_configure_options
      procedure :: set_src_dir
      procedure :: set_install_dir
      procedure :: set_src_path
      procedure :: set_build_dir
      procedure :: set_prereqpackages
      procedure :: set_prereqmodules

      procedure :: apt_install
      procedure :: module_load

      procedure :: download
      procedure :: extract
      procedure :: prerequisites
      procedure :: make_build_dir
      procedure :: configure
      procedure :: build
      procedure :: install

      procedure :: dlloc
   end type package
   !===============================================================================


contains


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_name(this, name)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: name

      this%name = name
   end subroutine set_name
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_version(this, version)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: version

      this%version = version
   end subroutine set_version
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_file_format(this, file_format)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: file_format

      this%file_format = file_format
   end subroutine set_file_format
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_download_link(this, download_link)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: download_link

      this%download_link = download_link
   end subroutine set_download_link
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_configure_options(this, configure_options)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: configure_options

      this%configure_options = configure_options
   end subroutine set_configure_options
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_src_dir(this, src_dir)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: src_dir

      this%src_dir = src_dir
   end subroutine set_src_dir
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_install_dir(this, install_dir)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: install_dir

      this%install_dir = install_dir
   end subroutine set_install_dir
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_prereqpackages(this, prereqpackages)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: prereqpackages

      this%prereqpackages = prereqpackages
   end subroutine set_prereqpackages
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_prereqmodules(this, prereqmodules)
      class(package), intent(inout) :: this
      character(len=*), intent(in) :: prereqmodules

      this%prereqmodules = prereqmodules
   end subroutine set_prereqmodules
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_src_path(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Set src path
      this%src_path = this%src_dir//"/"//this%name//"-"//this%version
   end subroutine set_src_path
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine apt_install(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Download the package
      ! call execute_command_line("apt-get install "&
      !    //this%prereqpackages &
      !    , exitstat=exstat)

      ! ! Check if download was successful
      ! if (exstat /= 0) then
      !    error stop ": File download failed. Please check the download link and try again."
      ! else
      !    print*,"Package downloaded successfully."
      ! endif
   end subroutine apt_install
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine module_load(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! ! Download the package
      ! call execute_command_line("ml -s "&
      !    //this%prereqmodules &
      !    , exitstat=exstat)

      ! ! Check if download was successful
      ! if (exstat /= 0) then
      !    error stop ": File download failed. Please check the download link and try again."
      ! else
      !    print*,"Package downloaded successfully."
      ! endif
   end subroutine module_load
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine download(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Download the package
      call execute_command_line("wget --output-document="&
         //this%src_path//this%file_format//" "//this%download_link &
         , exitstat=exstat)

      ! Check if download was successful
      if (exstat /= 0) then
         error stop ": File download failed. Please check the download link and try again."
      else
         print*,"Package downloaded successfully."
      endif
   end subroutine download
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine extract(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Create directory for extraction
      call execute_command_line("mkdir -p "//this%src_path &
         , exitstat=exstat)

      ! Check if directory creation was successful
      if (exstat /= 0) then
         error stop ": Failed to create directory for extraction. Please check the source directory and try again."
      else
         print*,"Directory for extraction created successfully."
      endif


      ! Extract the package
      select case (this%file_format)
       case (".tar.gz")
         call execute_command_line("tar xf "//this%src_path//this%file_format//&
            " -C "//this%src_dir//"/"//this%name//"-"//this%version//" --strip-components 1" &
            , exitstat=exstat)
      end select

      ! Check if extraction was successful
      if (exstat /= 0) then
         error stop ": Failed to extract package. Please check the downloaded file and try again."
      else
         print*,"Package extracted successfully."
      endif
   end subroutine extract
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine prerequisites(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Download the prerequisites
      call execute_command_line("cd "//this%src_path//" && ./contrib/download_prerequisites" &
         , exitstat=exstat)

      ! Check if download was successful
      if (exstat /= 0) then
         error stop ": Failed to download prerequisites. Please check the source directory and try again."
      else
         print*,"Prerequisites downloaded successfully."
      endif
   end subroutine prerequisites
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_build_dir(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      this%build_dir = this%src_path//"-build"
   end subroutine set_build_dir
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine make_build_dir(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Create the build directory
      call execute_command_line("mkdir -p "//this%build_dir &
         , exitstat=exstat)

      ! Check if directory creation was successful
      if (exstat /= 0) then
         error stop ": Failed to create build directory. Please check the source directory and try again."
      else
         print*,"Build directory created successfully."
      endif
   end subroutine make_build_dir
   !===============================================================================

   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine configure(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! Configure
      call execute_command_line("cd "//this%build_dir// &
         " && "//this%src_path// &
         "/configure --prefix="//this%install_dir//" "//this%configure_options &
         , exitstat=exstat)

      if (exstat /= 0) then
         error stop ": Configuration failed. Please check the downloaded files and try again."
      else
         print*,"Configuration completed successfully."
      endif
   end subroutine configure
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine build(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      call execute_command_line("cd "//this%build_dir//" && "//"make -j $(nproc)" &
         , exitstat=exstat)

      if (exstat /= 0) then
         error stop ": Build failed. Please check the configuration and try again."
      else
         print*,"Build completed successfully."
      endif
   end subroutine build
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine install(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! make install
      call execute_command_line("cd "//this%build_dir //" && "//"make install" &
         , exitstat=exstat)

      if (exstat /= 0) then
         error stop ": Installation failed. Please check the build directory and try again."
      else
         print*,"Installation completed successfully."
      endif
   end subroutine install
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine dlloc(this)
      class(package), intent(inout) :: this

      if (allocated(this%name))              deallocate(this%name)
      if (allocated(this%version))           deallocate(this%version)
      if (allocated(this%file_format))       deallocate(this%file_format)
      if (allocated(this%download_link))     deallocate(this%download_link)
      if (allocated(this%configure_options)) deallocate(this%configure_options)
      if (allocated(this%src_dir))           deallocate(this%src_dir)
      if (allocated(this%src_path))          deallocate(this%src_path)
      if (allocated(this%build_dir))         deallocate(this%build_dir)
      if (allocated(this%install_dir))       deallocate(this%install_dir)
      if (allocated(this%prereqpackages))    deallocate(this%prereqpackages)
      if (allocated(this%prereqmodules))     deallocate(this%prereqmodules)
   end subroutine dlloc
   !===============================================================================

end module forgnu

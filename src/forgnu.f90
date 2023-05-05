 !> author: Seyed Ali Ghasemi
module forgnu

   implicit none

   private

   public :: package

   !===============================================================================
   !> This type represents a software package, with attributes describing its name,
   !> version, file format, download link, configuration options, source directory,
   !> build directory, installation directory, and prerequisites (required packages
   !> and modules). It also includes procedures for downloading, extracting, configuring,
   !> building, and installing the package, as well as for installing prerequisites.
   type :: package
      character(len=:), allocatable :: name                 ! Name of the package
      character(len=:), allocatable :: version              ! Version of the package
      character(len=:), allocatable :: file_format          ! File format of the package
      character(len=:), allocatable :: download_link        ! Download link for the package
      character(len=:), allocatable :: configure_options    ! Configuration options for the package
      character(len=:), allocatable :: src_dir              ! Directory for the package source code
      character(len=:), allocatable :: src_path             ! Path for the package source code
      character(len=:), allocatable :: build_dir            ! Directory for the package build
      character(len=:), allocatable :: install_dir          ! Directory for the package installation
      character(len=:), allocatable :: prereqpackages       ! Required packages for the package
      character(len=:), allocatable :: prereqmodules        ! Required modules for the package
   contains
      ! Procedures for setting attributes
      procedure :: set_name                  ! Set the name of the package
      procedure :: set_version               ! Set the version of the package
      procedure :: set_file_format           ! Set the file format of the package
      procedure :: set_download_link         ! Set the download link for the package
      procedure :: set_configure_options     ! Set the configuration options for the package
      procedure :: set_src_dir               ! Set the directory for the package source code
      procedure :: set_install_dir           ! Set the directory for the package installation
      procedure :: set_src_path              ! Set the path for the package source code
      procedure :: set_build_dir             ! Set the directory for the package build
      procedure :: set_prereqpackages        ! Set the required packages for the package
      procedure :: set_prereqmodules         ! Set the required modules for the package

      ! Procedures for installing and setting prerequisites
      procedure :: apt_install               ! Install required packages using apt-get
      procedure :: module_load               ! Load required modules using module load

      ! Procedures for package management
      procedure :: download                  ! Download the package source code
      procedure :: extract                   ! Extract the package source code
      procedure :: prerequisites             ! Install required packages and modules
      procedure :: make_build_dir            ! Create the directory for the package build
      procedure :: configure                 ! Configure the package
      procedure :: build                     ! Build the package
      procedure :: install                   ! Install the package

      ! Procedures for deallocating memory
      procedure :: dlloc                     ! Deallocates memory
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

      ! ! Install required packages
      ! call execute_command_line("apt-get install "&
      !    //this%prereqpackages &
      !    , exitstat=exstat)

      ! ! Check if installation was successful
      ! if (exstat /= 0) then
      !    error stop ": Failed to install required packages. Please check the package names and try again."
      ! else
      !    print*,"Required packages installed successfully."
      ! endif
   end subroutine apt_install
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine module_load(this)
      class(package), intent(inout) :: this
      integer                       :: exstat

      ! ! Load the required modules
      ! call execute_command_line("ml -s "&
      !    //this%prereqmodules &
      !    , exitstat=exstat)

      ! ! Check if the loading was successful
      ! if (exstat /= 0) then
      !    error stop ": Failed to load required modules. Please check the module names and try again."
      ! else
      !    print*,"Required modules loaded successfully."
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
         error stop ": Package installation failed. Please check the prerequisite packages and try again."
      else
         print*, "Package installed successfully."
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

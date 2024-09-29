from conan import ConanFile

class cppManagement(ConanFile):
    generators = ("CMakeToolchain", "CMakeDeps")
    settings = ("os", "build_type", "arch", "compiler")

    def requirements(self):
        self.requires("boost/1.86.0")
        self.requires("opencv/4.10.0")
        self.requires("ffmpeg/7.0.1", override=True)

    def configure(self):
        self.options["boost"].header_only = True  # 使用 header-only 版本

    def layout(self):
        pass
# mda-vst3

MDA in VST3 format taken from Steinberg'ss VST3 SDK and adapted to be built outside of SDK's CMake project.

## Building instructions

Clone the repository + submodules and follow a standard CMake procedure:

```
$ git submodule update --init --recursive
$ mkdir build && cd build
$ cmake ..
# optional, change build options with e.g. $ ccmake ..
$ make
```

Originally packaged for the [Elk Audio OS](https://elk.audio) distribution.

---
MDA plugins are Copyright (c) 2008 and can be licensed as either MIT or GPL 2 or later.

GPL 3 version is chosen here as it is the one used by Steinberg's VST 3 SDK.
Official Steinberg's VST 3 SDK SDK repository:

https://github.com/steinbergmedia/vst3sdk

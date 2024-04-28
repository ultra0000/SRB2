
#!/bin/bash
export PREFIX="/opt/devkitpro/devkitPPC/bin/powerpc-eabi" 
export CC=$DEVKITPPCC"/bin/powerpc-eabi-gcc" 
export CPPFLAGS="-g -Wall -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float -DLOGMESSAGES -DHAVE_DOSSTR_FUNCS -D__WII__ -DPPC -DSRB2_BIG_ENDIAN -I/opt/devkitpro/libogc/include" 
export CPPFLAGS=$CPPFLAGS 
export PKG_CONFIG="/opt/devkitpro/portlibs/ppc/bin/powerpc-eabi-pkg-config" 
export SDL_CONFIG="/opt/devkitpro/portlibs/wii/bin/sdl2-config" 
export PNG_CONFIG="/opt/devkitpro/portlibs/ppc/bin/libpng-config" 
export LDFLAGS="-g -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float -lwiiuse -lbte -logc -lm -lstdc++" 

make clean -C src/
make SDL=1 NONX86=1 -C src/ \
 NOOPENMPT=1 NOHW=1 ECHO=1 NOGME=1 NONET=1 NOMIXER=1 UNIX=1 SDLMAIN=1 WII=1 STATIC=1 -j${nproc} 2>&1 | tee build.log

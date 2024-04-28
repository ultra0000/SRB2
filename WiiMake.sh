
#!/bin/bash
export PREFIX=$DEVKITPPC"/bin/powerpc-eabi" 
export CC=$DEVKITPPCC"/bin/powerpc-eabi-gcc" 
export CPPFLAGS="-g -Wall -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float -DLOGMESSAGES -DHAVE_DOSSTR_FUNCS -D__WII__ -DPPC -DSRB2_BIG_ENDIAN -I"$DEVKITPRO"/libogc/include" 
export PKG_CONFIG=$DEVKITPRO"/portlibs/ppc/bin/powerpc-eabi-pkg-config" 
export SDL_CONFIG=$DEVKITPRO"/portlibs/wii/bin/sdl2-config" 
export PNG_CONFIG=$DEVKITPRO"/portlibs/ppc/bin/libpng-config" 
export LDFLAGS="-g -DGEKKO -mrvl -mcpu=750 -meabi -mhard-float -l"$DEVKITPRO"/libogc/lib -lwiiuse -lbte -logc -lm -lstdc++" 

make clean
make SDL=1 NONX86=1 -C src/ \
 NOOPENMPT=1 NOHW=1 NOGME=1 NONET=1 NOMIXER=1 SDLMAIN=1 STATIC=1 -j${nproc} 2>&1 | tee build.log
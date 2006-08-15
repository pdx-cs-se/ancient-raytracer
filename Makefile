CXX = gcc -Wall
CC = gcc -Wall
DEBUGLEVEL = 0
# DEFINES = -DDEBUG=$(DEBUGLEVEL)
DEFINES =
CDEBUGFLAGS = -g -O2
CFLAGS = $(CDEBUGFLAGS) $(DEFINES)

# LIBS = -lfb -lrle -lm
LIBS = -lm
OBJS = render.o point.o poly.o xform.o object.o \
  ray.o texture.o fast_texture.o board_texture.o \
  output.o ppm_output.o oldppm_output.o \
  sphere.o light.o model.o \
  generate.o frandom.o
HDRS = point.h poly.h xform.h object.h \
  ray.h texture.h fast_texture.h board_texture.h \
  output.h ppm_output.h oldppm_output.h \
  sphere.h light.h model.h
.SUFFIXES: .cc

.cc.o:
	$(CXX) $(CFLAGS) -c $<

.c.o:
	$(CC) $(CFLAGS) -c $<

render: $(OBJS)
	$(CXX) $(CFLAGS) -o render $(OBJS) $(LIBS)

$(OBJS): render.h $(HDRS)

render.o generate.o: frandom.h generate.h

clean:
	-rm -f *.o render

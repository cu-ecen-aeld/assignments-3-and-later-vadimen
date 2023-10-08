ifeq (${CROSS_COMPILE}, aarch64-none-linux-gnu-)
	compiler=${CROSS_COMPILE}gcc
else
	compiler=gcc
endif
 
writer:
	${compiler} writer.c -o writer
clean:
	find . -type f -name '*.o' -exec rm -f {} +
	find . -type f -name 'writer' -exec rm -f {} + 

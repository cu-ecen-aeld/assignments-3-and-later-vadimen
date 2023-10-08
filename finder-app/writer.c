#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char **argv){
	openlog("vadim_writer", LOG_PID, LOG_USER);

	if(!argv[1] || !argv[2]){
		printf("one or both vars are not specified/n");
		syslog(LOG_ERR, "one or both vars are not specified");
		return 1;
	}

	syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);

	FILE *fptr = fopen(argv[1], "w");

	if(fptr == (void*)0){
		printf("error creating the file");
		syslog(LOG_ERR, "error creating the file");
		return 1;
	}

	int res = fprintf(fptr, "%s", argv[2]);

	if(!res){
		printf("error writing to the file");
		syslog(LOG_ERR, "error writing to the file");
		return 1;
	}
	
	fclose(fptr);
	closelog();
	return 0;
}

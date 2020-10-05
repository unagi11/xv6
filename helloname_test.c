#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char const *argv[])
{
	if (argc > 1) {
	    hello_name(argv[1]);
	} else {
		printf(1, "Usage : helloname_test name\n");
	}
	
	exit();
}
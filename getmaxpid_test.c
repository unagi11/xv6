#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char const *argv[])
{
	printf(1, "Maximum PID: %d\n", get_max_pid());
	exit();
}

/* defs.h
 * user.h
 * usys.S
 * syscall.h
 * syscall.c
 * sysproc.c
 * proc.c
 */

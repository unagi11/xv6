#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char const *argv[])
{
	printf(1, "Total Number of Active Processes: %d\n", get_num_proc());
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

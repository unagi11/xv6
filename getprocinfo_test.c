#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "processInfo.h"

int main(int argc, char const *argv[])
{
	struct processInfo procInfo;

	printf(1, "PID     PPID     SIZE        Number of Context Switch\n");

	for (int i = 1; i <= get_max_pid(); i++)
		if (get_proc_info(i, &procInfo) != -1)
			printf(1, "%d       %d        %d       %d\n", i, procInfo.ppid, procInfo.psize
				, procInfo.numberContextSwitches);
	exit();
}

/* defs.h > struct processInfo 이미 있음
 * user.h > struct processInfo
 * usys.S
 * syscall.h
 * syscall.c
 * sysproc.c > processInfo.h 추가
 * proc.c > processInfo.h 추가
 */

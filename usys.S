//usys.S : xv6의 시스템 호출 리스트
#include "syscall.h"
#include "traps.h"

#define SYSCALL(name) \
  .globl name; \
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
SYSCALL(exit)
SYSCALL(wait)
SYSCALL(pipe)
SYSCALL(read)
SYSCALL(write)
SYSCALL(close)
SYSCALL(kill)
SYSCALL(exec)
SYSCALL(open)
SYSCALL(mknod)
SYSCALL(unlink)
SYSCALL(fstat)
SYSCALL(link)
SYSCALL(mkdir)
SYSCALL(chdir)
SYSCALL(dup)
SYSCALL(getpid)
SYSCALL(sbrk)
SYSCALL(sleep)
SYSCALL(uptime)
SYSCALL(hello) 			// 1-1
SYSCALL(hello_name) 		// 1-2
SYSCALL(get_num_proc)		// 1-3
SYSCALL(get_max_pid)		// 1-4
SYSCALL(get_proc_info)	// 1-5
SYSCALL(cps)				// ps
SYSCALL(get_prio)
SYSCALL(set_prio)

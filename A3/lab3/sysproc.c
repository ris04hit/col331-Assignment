#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

/* System Call Definitions */
int 
sys_set_sched_policy(void)
{
    // Implement your code here 
    struct proc *curproc = myproc();

    int policy;
    argint(0, &policy);

    if (policy != 0 && policy != 1) return -22;

    curproc->policy = policy;
    return 0;
}

int 
sys_get_sched_policy(void)
{
    // Implement your code here 
    struct proc *curproc = myproc();

    return curproc->policy;
}

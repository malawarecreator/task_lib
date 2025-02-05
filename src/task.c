#include "task.h"
#include <stdint.h>

task_t tasks[10];

void scheduler_run() {
    while (1) {
        for (int i = 0; i < 10; i++) {
            if (tasks[i].active && tasks[i].func) {
                tasks[i].func();
            }
        }
    }
}


void add_task(task_func_t func) {
    for (int i = 0; i < 10; i++) {
        if (!tasks[i].active) {
            tasks[i].func = func;
            tasks[i].active = 1;
            
        }
    }
}
void terminate_task(task_func_t func) {
    for (int i = 0; i < 10; i++) {
        if (tasks[i].func == func) {
            tasks[i].active = 0;
        }
    }
}

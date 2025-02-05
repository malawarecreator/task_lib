#pragma once


#include <stdint.h>


typedef void (*task_func_t)(void);

typedef struct { 
    task_func_t func;
    uint8_t active;
} task_t;


void scheduler_run();

void add_task(task_func_t func);

void terminate_task(task_func_t func);

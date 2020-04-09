
#include <Utils/b3Clock.h>
#include <assert.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/shm.h>

#include <atomic>
#include <iostream>

#define ASSERT_EQ(a, b) assert((a) == (b));

const unsigned int kSecToNanosec = 1e9;
const unsigned int kShmSize = 1024;
const unsigned int kShmKey = 8765;

int main() {}
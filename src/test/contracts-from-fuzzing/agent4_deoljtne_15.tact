/// Test 22: ASM function attempting to call a non-asm function (expected to fail)

fun identity(x: Int): Int { return x; }

asm fun invalidCall(): Int { identity(42) }
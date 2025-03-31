/* Test 3: Using a primitive 43 without a consuming TVM instruction should yield a compilation error */

asm fun bad(): Int { 43 }
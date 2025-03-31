/* Test 7: Using the TVM instruction DEPTH to push the current stack depth
   Expected behavior: It should compile successfully and capture a value as Int
*/

asm fun depthFunc(): Int { DEPTH }
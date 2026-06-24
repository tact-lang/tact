// Fuzzing continued with additional asm functions edge cases

// 11. Test using lowercase TVM instruction in context: Should yield error
asm fun lowerCaseTest(): Int { 42 int } 

// 12. Assembly function with multiple instructions using stack manipulation
asm fun multiOps(a: Int, b: Int, c: Int): Int {
  SWAP      // swap a and b
  ADD       // add swapped operands
  PUSHINT   // push constant
  c ADD     // add c to result
}

fun testMultiOps(): Int {
   return multiOps(1, 2, 3);
}

// 13. Test an asm function where a struct parameter has nested struct fields with exactly 16 fields limit
struct S16 { f1:Int; f2:Int; f3:Int; f4:Int; f5:Int; f6:Int; f7:Int; f8:Int; f9:Int; f10:Int; f11:Int; f12:Int; f13:Int; f14:Int; f15:Int; f16:Int }

asm fun structEdge(s: S16): Int { DEPTH }  

fun testStructEdge(s: S16): Int {
  return structEdge(s);
}

// 14. Test using DEPTH after pushing extra values via PUSHINT instructions
asm fun depthExtra(): Int {
  10 PUSHINT
  20 PUSHINT
  DEPTH
}

fun testDepthExtra(): Int {
   return depthExtra();
}

// 15. Test an asm function with no return type that leaves a value on the stack; then a helper to capture it
asm fun pushAndNoCapture(x: Int) { PUSHINT }

// To test, we will push a value and then manually capture it via another asm function
asm fun captureTop(): Int { DROP }  // Not proper capture but used to test stack manipulation

fun testNoReturn(): Int {
   pushAndNoCapture(99);
   // In real contract execution, the value remains on stack; here we simulate by returning constant
   return 99;
}

// NOTE: Some of these edge test snippets are exploring how the compiler handles various arrangements, stack depth, and order of instructions. They are designed to push the compiler with valid usage and expected errors for mismatches.

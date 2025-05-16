// Test 5: Using arithmetic operations in asm function body with TVM primitives
// This snippet pushes two integers with PUSHINT and then uses ADD to sum them.
// The result is captured as the function's return value.
asm fun literal(): Int { 1 PUSHINT 2 PUSHINT ADD }

/// Test 24: Assembly function with no declared return type (should not capture a value)
// In assembly functions, if no return type is declared, no value is captured from the stack
asm fun noReturn() { DROP }

// Test: Accessing a parameter directly within asm function body; expected to be interpreted as a TVM instruction and cause a compilation error
asm fun misuseParameter(x: Int): Int { x PUSHINT }

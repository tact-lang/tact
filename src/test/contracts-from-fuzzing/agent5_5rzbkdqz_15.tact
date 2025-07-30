/// Test 15: asm function with no return type (should compile successfully)
asm fun noReturn(x: Int) { x PUSHINT }

/// Test 18: Testing attribute order sensitivity: using 'extends mutates' instead of 'mutates extends'
asm inline extends mutates fun testAttrOrder(self: Int): Int { self INC }

/// Test 20: Struct with exactly 16 fields should be allowed as an asm parameter
struct S16 { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; f6: Int; f7: Int; f8: Int; f9: Int; f10: Int; f11: Int; f12: Int; f13: Int; f14: Int; f15: Int; f16: Int }
asm fun testS16(s: S16): Int { f1 }

/// Test 22: Using a reserved word (SWAP) as a parameter name in an asm function
asm fun testReserved(SWAP: Int): Int { SWAP PUSHINT }

/// Test 23: Whitespace variations in asm function body
asm fun whitespaceTest(): Int {
    7    PUSHINT
    8    PUSHINT
    ADD
}

/// Test 24: Using lowercase TVM instruction token (should produce an error)
asm fun lowercase(): Int { 42 pushint }

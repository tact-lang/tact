/// Test 19: Edge-case numeric literal in allowed range
asm fun testPushEdge(): Int { -5 PUSHINT }

/// Test 20: Using stack-manipulation instructions: SWAP and DROP
asm fun testSwapDrop(): Int { 
    10 PUSHINT 20 PUSHINT SWAP DROP
    // Expected: after SWAP: stack: 20, 10; then DROP removes 20, leaving 10
}

/// Test 21: Chaining multiple TVM instructions - performing a chain of arithmetic operations
asm fun arithmeticChain(): Int {
    3 PUSHINT 4 PUSHINT ADD 2 PUSHINT MUL
    // Expected: (3+4)*2 = 14
}

/// Test 22: Complex nested structure flattening with no operations
struct C { x: Int; y: Int; }
struct D { c: C; z: Int; }

// In this test we simply access the flattened parameters, then push a constant
asm fun nestedAccess(d: D): Int { 
    // Flattened: d.c.x, d.c.y, d.z
    100 PUSHINT
}

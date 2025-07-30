asm fun getDepth(): Int { 
    DEPTH 
}

// Test 16: Using SWAP and DROP in sequence to manipulate stack
// This function pushes two values then swaps and drops one
asm fun manipulateStack(): Int { 
    10 PUSHINT 
    20 PUSHINT 
    SWAP 
    DROP 
}

// Test 17: Referencing stack registers explicitly in a context where not allowed
// In asm functions, using s0 explicitly is not allowed as an instruction argument unless required.
// We intentionally try to use s0 to see if it produces a compile error.
asm fun explicitStackRef(): Int { 
    s0 
}

// Test 18: Testing primitive argument order: push an integer and then call an instruction that expects an immediate argument
asm fun pushImmediate(): Int { 
    7 PUSHINT 
}

// Test 19: Combining multiple TVM instructions with no arrangement
// This should simply result in sequential stack manipulation.
asm fun multiOps(): Int { 
    3 PUSHINT 
    4 PUSHINT 
    ADD 
    2 PUSHINT 
    MUL 
}

// Test 20: Manipulate using negative number in PUSHINT to test opcode variant
asm fun pushNegative(): Int { 
    -10 PUSHINT 
}

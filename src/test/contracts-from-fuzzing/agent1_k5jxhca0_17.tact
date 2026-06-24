// Continuing our exhaustive fuzz-testing of asm functions, here are additional tests:

// Test 16: Using TVM instruction DEPTH to return current stack depth
asm fun getDepth(): Int { 
    DEPTH 
}

// Test 17: Using a combination of SWAP and DROP to manipulate the stack
asm fun manipulateStack(): Int { 
    10 PUSHINT 
    20 PUSHINT 
    SWAP 
    DROP 
}

// Test 18: Explicitly referencing a stack register (s0) in a context which should not be allowed
asm fun explicitStackRef(): Int { 
    s0 
}

// Test 19: Using a TVM instruction with an immediate integer that should trigger the proper opcode variant
asm fun pushImmediate(): Int { 
    7 PUSHINT 
}

// Test 20: Combining multiple TVM instructions: push, add, and multiply
asm fun multiOps(): Int { 
    3 PUSHINT 
    4 PUSHINT 
    ADD 
    2 PUSHINT 
    MUL 
}

// Test 21: Using negative number with PUSHINT to test opcode variant for negative values
asm fun pushNegative(): Int { 
    -10 PUSHINT 
}

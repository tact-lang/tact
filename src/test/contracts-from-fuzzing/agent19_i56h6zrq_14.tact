struct Dummy { d: Int }

// Test 19: asm function with mismatched captured return type
// This function pushes an Int onto the stack and attempts to capture it as a Cell, which should lead to a runtime type error
asm fun badReturnType(): Cell { 42 PUSHINT }

// Test 20: asm function using the TVM instruction alias '2DROP' (alias for DROP2)
// This should compile successfully as '2DROP' is a valid alias for DROP2
asm fun dropTwo(): Int { 1 2 2DROP }

// Test 21: asm function with inline attribute. Although inline attribute does nothing (asm functions are always inlined), it should be accepted.
asm inline fun inlineTest(): Int { 1 2 ADD }

// Test 22: asm function using the DUP instruction to duplicate the top-of-stack value.
// This should compile successfully
asm fun dupTest(): Int { DUP }

// Test 23: asm function mixing arithmetic instructions: (3 + 4) * 5, expecting result 35
asm fun mixTest(): Int { 3 4 ADD 5 MUL }

// A showcase function to call these asm functions (for reference only)
fun showcase() {
    let _ = badReturnType(); // Might cause a runtime type-check error
    let _ = dropTwo();
    let _ = inlineTest();
    let _ = dupTest();
    let _ = mixTest();
}

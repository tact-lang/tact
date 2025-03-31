// Fuzz Testing Cycle: Continuation (Snippets 16-22 Reworked)

// The Tact documentation specifies that for an asm function returning a single value (Int), the return arrangement can only mention position 0.
// Therefore, using an arrangement for parameters (arg rearrangement) is separate from the return arrangement. 
// For a function returning Int, we cannot rearrange the return values because there is exactly one value (position 0). 
// Instead, we separate the parameter arrangement from the return arrangement.

// Test snippet 16: Testing parameter arrangement only (without return arrangement) for a function that returns Int.
// We want to reverse the order in which parameters are pushed onto the stack and then add them.
// For parameter arrangement only, we write: asm(a b) fun reverseAdd(a: Int, b: Int): Int { SWAP ADD }
asm(a b) fun reverseAdd(a: Int, b: Int): Int { SWAP ADD }

// Test snippet 17: Testing pushing multiple immediate constants sequentially
asm fun pushMultiple(): Int {
    1 INT
    2 INT
    ADD
}

// Test snippet 18: Testing boundary literal value for PUSHINT opcode
asm fun boundaryPush(): Int { 10 INT }

// Test snippet 19: Testing using SWAP on a stack with insufficient elements
// This function may compile, but if executed, it should produce a runtime stack underflow.
asm fun underflowTest(): Int { SWAP }

// Test snippet 20: Testing mixed whitespace and inline comments with valid instructions
asm fun mixedWhitespace(): Int {
    5     INT  // push 5
    3     INT  // push 3
    SWAP         // swap top two
    ADD          // add
}

// Test snippet 21: Combining argument arrangement with a valid return arrangement for a function returning a struct.
// For a function returning MyPair (with two fields) we can rearrange return values. 
struct MyPair { first: Int; second: Int }
// For a function returning MyPair, two return positions exist: positions 0 and 1. 
// We use arrangement (-> 1 0) to swap the order of return values.
asm(a b -> 1 0) fun combinePair(a: Int, b: Int): MyPair { SWAP }

// Test snippet 22: Testing chaining instructions with comments and proper spacing
asm fun chainedInstructions(): Int {
    // Push initial value
    8 INT
    // Duplicate it by pushing another literal
    8 INT
    ADD      // Sum to get 16
}

/// Valid tests for asm functions without known errors

// Test 1: Valid asm function using arrangement
asm(s len -> 0) fun asmSwap(s: Slice, len: Int): Slice { SWAP }

// Test 4: Valid asm function using mutates attribute with arrangement (as per docs example)
asm(-> 1 0) extends mutates fun asmMutateLDREF(self: Slice): Cell { LDREF }

// Test 6: Valid multi-line assembly function mixing instructions and comments
asm fun asmMultiLine(): Int {
    // Push constant 7 onto stack
    7 INT
    // Duplicate top of stack
    DUP
    // Drop duplicate
    DROP
}

// Test 7: Assembly function with nested arrangement: using struct as return type
struct Pair { first: Int; second: Int }
asm fun asmReturnPair(a: Int, b: Int): Pair {
    // Push a and b onto the stack
    a INT
    b INT
    // Rearrangement: For Pair, captured right-to-left, so swap to correct order
    SWAP
}

// Test 9: Assembly function with valid argument arrangement using multiple arguments
struct Triple { a: Int; b: Int; c: Int }
asm(a b c -> 2 1 0) fun asmTriple(a: Int, b: Int, c: Int): Triple {
    a INT
    b INT
    c INT
    // Rearrangement: (2 1 0) means that the top-of-stack order is reversed
    SWAP
    SWAP
}

// Test 10: Assembly function with a valid call to a TVM instruction that involves numbers beyond inline literal range
asm fun asmPushLargeNumber(): Int { 300 PUSHINT }

// Test 11: Valid asm function that uses DUP and DROP in sequence to simulate stack depth modifications
asm fun asmStackManipulate(): Int {
    DUP
    DUP
    DROP
    DROP
}

// Test 12: Assembly function that returns no value (void asm function)
asm fun asmNoReturn() { 42 INT DROP }

fun main() {
    let s = beginCell().asSlice();
    let _ = asmSwap(s, 5);
    let _ = s.asmMutateLDREF();
    let _ = asmMultiLine();
    let pair: Pair = asmReturnPair(10, 20);
    let triple: Triple = asmTriple(1, 2, 3);
    let _ = asmPushLargeNumber();
    let _ = asmStackManipulate();
    asmNoReturn();
}

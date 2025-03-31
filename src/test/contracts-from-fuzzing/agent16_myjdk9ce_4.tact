/// Test 1: Valid asm function using arrangement (corrected for single return)
asm(s len -> 0) fun asmSwap(s: Slice, len: Int): Slice { SWAP }

/// Test 2: Lowercase TVM instruction (should error)
asm fun asmLowerCase(): Int { 42 int }

/// Test 3: Assembly function with stray primitive (should error)
asm fun asmStrayPrimitive(): Int { 43 }

/// Test 4: Valid asm function using mutates attribute with arrangement (as per docs example)
asm(-> 1 0) extends mutates fun asmMutateLDREF(self: Slice): Cell { LDREF }

/// Test 5: Attempt to reference a parameter inside asm body (should error)
struct Dummy { a: Int }
asm fun asmParamRef(dummy: Dummy): Int { dummy }

/// Test 6: Valid multi-line assembly function mixing instructions and comments
asm fun asmMultiLine(): Int {
    // Push constant 7 onto stack
    7 INT
    // Duplicate top of stack
    DUP
    // Drop duplicate
    DROP
}

/// Test 7: Assembly function with nested arrangement: using struct as return type
struct Pair { first: Int; second: Int }
asm fun asmReturnPair(a: Int, b: Int): Pair {
    // push a and b onto the stack
    a INT
    b INT
    // Rearrangement: Pair has two fields, captured right-to-left so need to swap
    SWAP
}

fun main() {
    // Call valid functions
    let _ = asmSwap(beginCell().asSlice(), 5);
    // For the mutates function, call it as an extension (as per error suggestion)
    let _ = beginCell().asSlice().asmMutateLDREF();
    let _ = asmMultiLine();
    let pair: Pair = asmReturnPair(10, 20);
}

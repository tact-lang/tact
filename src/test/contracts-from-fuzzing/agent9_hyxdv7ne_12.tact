struct Pair { a: Int; b: Int }

// This asm function creates a Pair by pushing two integers onto the stack
// and then using a return arrangement that swaps their order: final Pair is { a: second, b: first }
asm(-> 1 0) fun createSwappedPair(): Pair {
    1 PUSHINT
    2 PUSHINT
}

// Test for naming conflict: using a parameter name that is a valid TVM instruction
asm fun conflictParam(INC: Int): Int { INC }

// Test using a wildcard parameter name; since the parameter is not accessible, the body uses a constant
asm fun testWildcard(_: Int): Int { 42 PUSHINT }
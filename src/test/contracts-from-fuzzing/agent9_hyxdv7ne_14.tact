/// Test: Simple RPN addition with two primitives pushed
asm fun sum20And10(): Int {
    10 PUSHINT
    20 PUSHINT
    ADD
}

/// Test: Assembly function that uses a TVM instruction outside valid numeric range
/// For example, pushing a number that determines a different opcode variant of PUSHINT. 
asm fun testPushRange(): Int {
    -128 PUSHINT
}

/// Test: Using a nested struct parameter flattening
struct AB { a: Int; b: Int }
struct Nested { inner: AB; c: Int }

// This assembly function will try to add all flattened fields: order is: first field of AB, second field of AB, then c
asm fun addNested(n: Nested): Int {
    ADD  // adds second and first field of AB
    ADD  // adds the result with c
}

/// Test: Assembly function using correct case for an instruction and ensuring that extra quotes cause error
asm fun testProperCase(): Int {
    42 PUSHINT
}

/// Test: Function using a quoted instruction (this should fail)
asm fun testQuoted(): Int { "PUSHINT" }

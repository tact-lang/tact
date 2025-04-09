// Fuzz Testing: Advanced asm Functions Edge Cases

// 1. Swap function using a combined arrangement on parameters and return values
struct Pair { first: Int; second: Int }

// This function should swap input parameters using arrangement: parameters 'a' and 'b' are initially pushed in order (a then b),
// and the arrangement '-> 1 0' will swap them, so the returned Pair will have first = b, second = a
asm(a b -> 1 0) fun swap(a: Int, b: Int): Pair { 
    // No additional TVM instruction; rely on parameter passing
}

fun testSwap() {
    let p: Pair = swap(1, 2);
}

// 2. Arrangement referencing an invalid stack index (should trigger a compilation error)
// Expected error: return rearrangement must mention only valid return position numbers: [0..0]
// Uncomment the below to test the error
// asm(-> 0 2) fun wrongArrangement(): Int { 42 PUSHINT }

// 3. Mutates attribute with a mismatched 'self' type
// The documentation requires that for a mutates asm function, the type of the deepest stack value (captured as self) must match
// the declared type of 'self'. Here we deliberately mismatch by declaring self as Cell, while the actual value is a Slice.
// Expected: type-check error at runtime. However, at compile time, the arrangement is accepted. 
struct Dummy { x: Int }

asm(-> 1 0) extends mutates fun wrongMutates(self: Cell): Int { 42 PUSHINT }

// 4. Modify stack in body: pop the only value, leading to stack underflow on return
// The compiler may compile this, but it would fail at runtime with exit code 2 if called
asm fun dropResult(): Int { 42 PUSHINT DROP }

// 5. Empty asm body with a return type (testing if empty body correctly captures parameters via arrangement)
// Here, we rely on the fact that parameters are pushed to stack before the body runs
// and the function captures them if a return type is specified.
// We'll define a trivial identity function
asm fun identity(x: Int): Int { } 

fun testIdentity() {
    let y: Int = identity(123);
}

// 6. ASM function with valid inline attribute (already tested inlineTest above, but present here for completeness)
asm inline fun inlineTest(): Int { 42 PUSHINT }

// 7. Testing borderline values for PUSHINT opcodes (already done separately)
asm fun borderline1(): Int { -5 PUSHINT }
asm fun borderline2(): Int { 11 PUSHINT }

// 8. Using DEPTH and SWAP instructions to verify stack manipulation
asm fun stackManipulation(): Int {
    DEPTH       // push current depth
    1 PUSHINT   // push constant 1
    SWAP        // swap them
    ADD         // add the two values
}

fun testStackManipulation() {
    let res: Int = stackManipulation();
}

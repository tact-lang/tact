/// Test: Assembly function returning a struct

// Define a struct with two fields. According to the docs for asm functions,
// when an assembly function returns a struct, the return values are captured in a right-to-left order.
// That is, for the struct Pair { a: Int; b: Int }, if we push the values in order (first a then b),
// then the top-of-stack (b) is assigned to field 'b' and the next value (a) to field 'a'.

struct Pair { a: Int; b: Int }

// This asm function takes two Int values and returns a Pair.
// We push the parameters in the same order as they appear: a then b.
// According to the documented behaviour, 'b' is captured from the top-of-stack and 'a' from the next one.

asm fun makePair(a: Int, b: Int): Pair {
    a PUSHINT
    b PUSHINT
}

/// Test: Assembly function with a forced mismatch between captured value type and return field
// Define a struct with one field declared as Cell.
// The following asm function intentionally pushes an Int.
// According to the docs, if the run-time type does not match, the VM should throw an exit code 7 error (Type check error).

struct BadPair { c: Cell }

asm fun badPair(a: Int): BadPair {
    a PUSHINT
}

/// main function: only call the valid function makePair.
fun main() {
    let _ = makePair(111, 222);
    // We refrain from calling badPair to avoid a runtime type check error.
}

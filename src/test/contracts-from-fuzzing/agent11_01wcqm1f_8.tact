/// Test: Assembly function returning a struct

// Define a struct with two fields. According to the docs, for a struct with two fields, the last field captures the top-of-stack value.
struct Pair { a: Int; b: Int }

// This asm function takes two Ints and returns a Pair. 
// The parameters are pushed in order: first parameter then second parameter. For the returned struct,
// the field 'b' should capture the top-of-stack value and 'a' the next.
// We'll push the parameters in reversed order deliberately to see if the fields are assigned correctly.

asm fun makePair(a: Int, b: Int): Pair { 
    // Expected: a is pushed first, then b; but we want Pair { a: a, b: b }
    // We can use an arrangement if needed, but trying to check default behavior:
    // Actually, by default, parameters are not automatically used in the body. We can simply push them in order: a PUSHINT, b PUSHINT
    // Then the return type expects two values: the first field (a) and second field (b) to be captured from the stack.
    // But note: for struct capture, the fields are captured in reverse: the top-of-stack goes to the last field, the lower goes to the first.
    // Thus, if we push a then b, the assembler will capture: field 'a' gets a and field 'b' gets b? Let's follow doc: "the last field gets top-of-stack".
    // Actually, to have Pair { a: a, b: b}, we need to push a then b. Then the captured value for field 'b' is b, and field 'a' is a.
    a PUSHINT
    b PUSHINT
}

/// Test: Assembly function with a forced mismatch between captured value type and return field
// For example, attempt to capture a number into a Field declared as Cell. That should produce error at runtime if called but compile normally.
// We define a struct with field c: Cell.

struct BadPair { c: Cell }

asm fun badPair(a: Int): BadPair {
    a PUSHINT
}

/// main function calls the valid function makePair, but does not call badPair to avoid runtime error.
fun main() {
    let _ = makePair(111, 222);
}

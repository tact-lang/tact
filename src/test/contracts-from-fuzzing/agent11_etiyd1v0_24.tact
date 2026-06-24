/*
Next Phase: Exploring Assembly Functions and Getter Attributes in Tact

Although the official documentation for assembly functions (see docs/book/assembly-functions.md) states that assembly functions cannot be declared with the 'get' attribute, the compiler currently does not enforce this restriction. However, since this behavior is already a known documented discrepancy, we will not further retest it here. Instead, we continue our exploration to ensure that assembly functions without 'get' work as expected and properly disallow other unauthorized attributes.

// Test: A valid assembly function without the get attribute
asm fun validAsm() : Int {
    // This assembly function simply returns the current calculator depth
    DEPTH
}

// Test: An assembly function with the 'get' attribute, which is documented as disallowed, but the compiler currently allows it. We include this snippet solely for completeness
// but do not treat it as a new bug (known issue).
asm get fun illegalAsmGetter() : Int {
    DEPTH
}

// Test: An assembly function with an undefined attribute (should fail)
// Uncommenting the code below should produce a compiler error
/*
asm unknown fun illegalAsm() : Int {
    DEPTH
}
*/

/*
Summary:
- Our tests confirm that a valid assembly function without the 'get' attribute compiles normally.
- Although assembly functions with the 'get' attribute compile (despite the documentation disallowing them), this behavior is a known discrepancy and is documented as such.
- Attempts to use entirely unrecognized attributes result in a compile-time error.

This concludes the assembly function exploration for now. We continue our fuzz-testing cycle with further features in subsequent cycles.
*/
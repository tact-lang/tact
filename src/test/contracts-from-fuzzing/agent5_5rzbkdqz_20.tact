/// Test 44: Valid extension asm function using 'extends' so that the first parameter must be named 'self'
asm extends fun inc(self: Int): Int { self INC }

fun testExtension2() {
    let res = 5.inc();
}

/// Test 45: Edge-case: asm function using multiple nested structs with maximum allowed fields

struct Inner16 { a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int; i: Int; j: Int; k: Int; l: Int; m: Int; n: Int; o: Int; p: Int }
struct OuterNested { inner: Inner16; q: Int }

// Flattening: parameters will be: inner.a, inner.b, ..., inner.p, q; there are exactly 17 primitive values, allowed per spec? Actually, docs say parameter is limited to 16 fields. But nested accepts up to 16 fields per struct. So if Inner16 has 16 fields, OuterNested, when flattened, will have 16+1=17 fields, which might exceed limitations on the parameter list. But the docs mention for parameters and returns: 16 parameters max. Let's try and see if compile error is thrown as expected.
asm fun testNestedStruct(o: OuterNested): Int { a b c d e f g h i j k l m n o p q ADD }

/// Test 46: ASM function mixing multiple comments and whitespace variations
asm fun mixWhitespace(): Int {
    11    PUSHINT    
    // Comment here
    12    PUSHINT    
    SWAP
    ADD   
    // End of function comment
}

/// Test 47: Using multiple sequential DUP, SWAP, and ADD in complex pattern
asm fun complexStack(x: Int): Int {
    x PUSHINT
    DUP
    DUP
    SWAP
    ADD
    DUP
    ADD
}

fun testComplexStack() {
    let res = complexStack(3);
}

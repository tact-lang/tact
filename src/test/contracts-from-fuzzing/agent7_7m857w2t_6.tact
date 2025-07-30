/// Comprehensive testing of asm functions in Tact

// 1. Basic asm function that returns a literal 42
asm fun basicAsm(): Int { 42 PUSHINT }

// 2. Identity function: uses empty body to capture argument from the stack.
asm fun identity(x: Int): Int { }

// 3. Test of primitive usage error: a lone primitive not consumed by any TVM instruction.
// Expected to produce a compilation error as documented.
asm fun bad(): Int { 43 }

// 4. Invalid parameter reference: directly using a parameter name in the asm body, which is interpreted as a TVM instruction.
// Expected to produce a compilation error.
asm fun invalidParamRef(x: Int): Int { x }

// 5. Swap test: swap the order of two parameters then add them; parameters are pushed with first at the bottom and second at the top.
asm fun swapTest(a: Int, b: Int): Int { SWAP ADD }

// 6. Return TVM stack depth for debugging purposes.
asm fun depthFun(): Int { DEPTH }

// 7. Test of struct flattening: adding two fields of a struct.
struct AB { a: Int; b: Int }
asm fun addStruct(ab: AB): Int { ADD }

// 8. Test of capturing two return values into a struct minmax.
struct MinMax { minVal: Int; maxVal: Int }
asm fun minmax(a: Int, b: Int): MinMax { MINMAX }

// 9. Test of nested struct flattening and computation.
struct Nested { 
    first: AB; 
    second: AB 
}
// Flattening order: first.a, first.b, second.a, second.b (first pushed first, then subsequent fields).
// To sum all four numbers, we apply three ADD operations in RPN:
// After pushing: stack = [ first.a, first.b, second.a, second.b ] (top is second.b )
// ADD: top two sum: second.a + second.b, stack becomes: [ first.a, first.b, (second.a+second.b) ]
// ADD: add first.b: (first.b + (second.a+second.b)), stack: [ first.a, sum2 ]
// ADD: add first.a: result = first.a + first.b + second.a + second.b
asm fun sumNested(n: Nested): Int { ADD ADD ADD }

// 10. Test of stack underflow: performing more DROP operations than available initial values.
// Note: TVM initialization always pushes some initial values but if we drop too many, we expect a run-time error (exit code 2: Stack underflow).
// This snippet is for runtime testing and should not affect compilation.
asm fun underflowTest(): Int { DROP DROP DROP DROP DROP DROP }


// Main function to call various tests (except those expected to fail at compile time or cause run-time errors).
fun main() {
    let r1 = basicAsm();              // Expected: 42
    let r2 = identity(100);             // Expected: 100
    let r3 = swapTest(5, 10);           // Expected: 15
    let r4 = depthFun();              // Returns current stack depth (debugging value)
    let r5 = addStruct(AB{ a: 20, b: 30 }); // Expected: 50
    let mm = minmax(40, 50);            // Expected: mm.minVal = 40, mm.maxVal = 50
    let s = sumNested(Nested{ first: AB{ a: 1, b: 2 }, second: AB{ a: 3, b: 4 } }); // Expected: 1+2+3+4 = 10

    // The calls to bad() and invalidParamRef() are intentionally omitted from main because they should cause compile-time errors.
    // Similarly, underflowTest() is not called to avoid run-time termination.
}

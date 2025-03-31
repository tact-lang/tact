// Final Comprehensive Fuzz Test Report for asm Functions in Tact
//
// This code snippet aggregates the various fuzz tests for asm functions that were executed in separate modules.
// To ensure that all definitions are available in this snippet, we include all necessary definitions inline.

// Minimal valid asm function: identity function (empty body returns the pushed parameter)
asm fun identity(x: Int): Int { }

// Other tests from previous snippets:
asm fun doubleValue(x: Int): Int { DUP ADD }

struct Pair { first: Int; second: Int }
// Swap function using arrangement: swaps two parameters
asm(a b -> 1 0) fun swap(a: Int, b: Int): Pair { }

struct Inner { a: Int; b: Int }
struct Outer { i1: Inner; i2: Inner }
// Sum nested: sums all four fields of Outer (after flattening orders: i1.a, i1.b, i2.a, i2.b)
asm fun sumNested(o: Outer): Int { ADD ADD ADD }

// A stress test function: combines several TVM instructions
asm fun stressTest(x: Int): Int {
    DUP         // duplicate x
    1 PUSHINT   // push constant 1
    ADD         // add x and 1
    SWAP        // swap the two values
    ADD         // add them
    DROP        // drop the result
}

// A simple inline asm function returning a constant
asm inline fun constant42(): Int { 42 PUSHINT }

// Function using DEPTH
asm fun usingDEPTH(x: Int): Int { DEPTH }

// Nested swap: using structures A and B
struct A { x: Int; y: Int }
struct B { a: A; b: A }
// This uses arrangement to swap the two A-type parameters in the return
asm(a b -> 1 0) fun nestedSwap(a: A, b: A): B { }

// Arrangement with multiple return values: tripleReorder
// Define a structure with three fields to test a custom return arrangement
struct Triple { a: Int; b: Int; c: Int }

// In this asm function, we push three constants onto the stack. Without arrangements, the default capture order for Triple is:
// - field c gets the topmost value, then b, then a.
// We now specify a custom return arrangement to reorder the values before capture.
// The arrangement '-> 2 0 1' indicates that the new order of stack values should be:
//   new_stack[0] = old_stack[2] (which is 3),
//   new_stack[1] = old_stack[0] (which is 1),
//   new_stack[2] = old_stack[1] (which is 2).
// Then, the struct fields are captured in the default right-to-left order: the last field 'c' gets the top (2), 'b' gets the next (1), and 'a' gets bottom (3).
// Final captured Triple should be { a: 3, b: 1, c: 2 }.

asm(-> 2 0 1) fun tripleReorder(): Triple {
    1 PUSHINT
    2 PUSHINT
    3 PUSHINT
}

// Aggregated main function to ensure compilation
fun main() {
    let idVal: Int = identity(123);
    let doubled: Int = doubleValue(21);
    let p: Pair = swap(10, 20);
    let sumVal: Int = sumNested(Outer{ i1: Inner{ a: 1, b: 2 }, i2: Inner{ a: 3, b: 4 } });
    let constVal: Int = constant42();
    let depthVal: Int = usingDEPTH(0);
    let ns: B = nestedSwap(A{ x: 5, y: 6 }, A{ x: 7, y: 8 });
    let tripleVal: Triple = tripleReorder();

    // Use a non-identity reference to satisfy the main function
    let _ = idVal + doubled + sumVal + constVal + depthVal + tripleVal.a + tripleVal.b + tripleVal.c;
    let _ = p;
    let _ = ns;
}

// Final Comprehensive Fuzz Test Report for asm Functions in Tact
//
// This code snippet aggregates the various fuzz tests for asm functions that were executed in separate modules.
// To ensure that all definitions are available in this snippet, we re-declare some of the functions (like identity) that were previously defined.

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
    SWAP        // swap (although with two values, just reverses order)
    ADD         // add them
    DROP        // drop the result (if captured, would result in underflow, but here function returns nothing; however, declared return type is Int, so this is just for testing)
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

// Main function to invoke some tests to ensure project compiles
fun main() {
    let idVal: Int = identity(123);
    let doubled: Int = doubleValue(21);
    let p: Pair = swap(10, 20);
    let sumVal: Int = sumNested(Outer{ i1: Inner{ a: 1, b: 2 }, i2: Inner{ a: 3, b: 4 } });
    let constVal: Int = constant42();
    let depthVal: Int = usingDEPTH(0);
    let ns: B = nestedSwap(A{ x: 5, y: 6 }, A{ x: 7, y: 8 });

    // Prevent unused warnings
    let _ = idVal;
    let _ = doubled;
    let _ = p;
    let _ = sumVal;
    let _ = constVal;
    let _ = depthVal;
    let _ = ns;
}

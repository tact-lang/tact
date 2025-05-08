// Final Aggregated asm Functions Fuzz Testing Report
//
// This code snippet aggregates the various fuzz tests for asm functions that were executed in separate modules.
// All necessary definitions are included inline to ensure that the final project compiles.

// Minimal valid asm function: identity function (empty body that returns the pushed parameter)
asm fun idAsm(x: Int): Int { }

// Additional tests:
asm fun doubleValue(x: Int): Int { DUP ADD }

struct Pair { first: Int; second: Int }
// Swap function using arrangement: swaps two parameters
asm(a b -> 1 0) fun swap(a: Int, b: Int): Pair { }

struct Inner { a: Int; b: Int }
struct Outer { i1: Inner; i2: Inner }
// Sum nested: sums all four fields of Outer (after flattening: i1.a, i1.b, i2.a, i2.b)
asm fun sumNested(o: Outer): Int { ADD ADD ADD }

// A stress test function: combines several TVM instructions (DUP, PUSHINT, ADD, SWAP, DROP)
asm fun stressTest(x: Int): Int {
    DUP         // duplicate x
    1 PUSHINT   // push constant 1
    ADD         // add x and 1
    SWAP        // swap the two values
    ADD         // add them (result = 2*x + 1)
    DROP        // drop the result (for testing DROP; note: if captured, this could cause stack underflow, but here it's used solely for observation)
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

// In this asm function, we push three constants onto the stack. Without arrangements, Triple would capture default (a gets bottom, c gets top).
// With arrangement '-> 2 0 1', the new order is:
//   new_stack[0] = old_stack[2] (3),
//   new_stack[1] = old_stack[0] (1),
//   new_stack[2] = old_stack[1] (2).
// Then, capturing for Triple occurs in right-to-left order: field c gets top (2), field b gets next (1), and field a gets bottom (3).
// So, tripleReorder() should return Triple { a: 3, b: 1, c: 2 }.

asm(-> 2 0 1) fun tripleReorder(): Triple {
    1 PUSHINT
    2 PUSHINT
    3 PUSHINT
}

// Test for nested arrangement with structures
struct C { m: Int; n: Int }
struct D { first: C; second: C }
// Define a function using arrangement for nested structures similar to swap.
asm(first second -> 1 0) fun nestedSwapCD(first: C, second: C): D { }

// Final main function to ensure the aggregated project compiles.
fun main() {
    let idVal: Int = idAsm(123);
    let doubled: Int = doubleValue(21);
    let p: Pair = swap(10, 20);
    let sumVal: Int = sumNested(Outer{ i1: Inner{ a: 1, b: 2 }, i2: Inner{ a: 3, b: 4 } });
    let constVal: Int = constant42();
    let depthVal: Int = usingDEPTH(0);
    let ns: B = nestedSwap(A{ x: 5, y: 6 }, A{ x: 7, y: 8 });
    let tripleVal: Triple = tripleReorder();
    let d: D = nestedSwapCD(C{ m: 100, n: 200 }, C{ m: 300, n: 400 });

    // Use variables to avoid unused warnings
    let _ = idVal + doubled + sumVal + constVal + depthVal + tripleVal.a + tripleVal.b + tripleVal.c + p.first + p.second + d.first.m + d.second.n;
    let _ = ns;
}

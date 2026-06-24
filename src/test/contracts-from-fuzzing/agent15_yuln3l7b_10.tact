// Further Fuzz Testing: Complex Nested Structures and Arrangements

// Define a simple structure
struct A { x: Int; y: Int }

// Define a nested structure containing two A-records
struct B { a: A; b: A }

// The expected flattening order for struct A is: first x then y.
// For struct B, the flattened order is: a.x, a.y, b.x, b.y.
// We define an asm function with an arrangement that swaps the positions of the two A parameters.
// When calling nestedSwap, parameters are pushed in order (first A then second A) and then arrangement '-> 1 0' swaps them.
// Consequently, the returned struct B should pack the first field from the second argument and the second field from the first argument, though
// note that since B and A are structural and only used to capture the stack, we are merely validating if the arrangement is accepted.

asm(a b -> 1 0) fun nestedSwap(a: A, b: A): B { }

fun testNestedSwap() {
    let r = nestedSwap(A{ x: 1, y: 2 }, A{ x: 3, y: 4 });
    // Expected behavior: r.a should correspond to second argument (A{ x:3, y:4 }) and r.b to first (A{ x:1, y:2 }) due to the arrangement swap.
}

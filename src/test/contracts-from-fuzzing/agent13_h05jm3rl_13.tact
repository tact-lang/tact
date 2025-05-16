/// Test 8: Testing struct parameter flattening and nested struct ordering

// Define a struct with two integer fields
struct A { x: Int; y: Int }

// Define a nested struct containing two A's
struct NestedA { first: A; second: A }

// Define an assembly function that sums all values passed in the nested struct
asm fun sumNested(n: NestedA): Int {
    // Given flattening, the parameters are pushed as: n.first.x, n.first.y, n.second.x, n.second.y
    // We'll add them all up: first add top two, then add next two, then add result
    ADD          // n.second.x + n.second.y
    SWAP         // Bring n.first.y to top
    ADD          // n.first.y + (n.second.x+n.second.y)
    SWAP         // Bring n.first.x to top
    ADD          // total sum
}

fun test_sumNested(): Int {
    // Construct a NestedA with known values: (1,2) and (3,4) so sum should be 10
    return sumNested(NestedA { first: A { x: 1, y: 2 }, second: A { x: 3, y: 4 } });
}

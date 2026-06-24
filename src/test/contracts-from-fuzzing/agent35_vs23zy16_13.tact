///////////////////////////
// Test 8 (revised): Using '_' in destructuring assignment to discard a field (valid usage)
///////////////////////////

struct Two { first: Int; second: Int }

fun testDestructure() {
    let Two { first, second: _ } = Two { first: 1, second: 2 };
    dump(first);
}

contract Test {
    receive() {
        testDestructure();
    }
}

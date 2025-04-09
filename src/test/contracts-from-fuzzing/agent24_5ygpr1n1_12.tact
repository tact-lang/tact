struct Pair { a: Int; b: Int }

fun testPair(): Int {
    // Test: Discard all fields using wildcards in a complete destructuring assignment
    let Pair { a: _, b: _ } = Pair { a: 1, b: 2 };
    return 0;
}

contract Test {
    receive() {
        testPair();
    }
}

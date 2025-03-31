// Test 5: Multiple wildcards in destructuring assignment (valid usage)

struct Triple { a: Int; b: Int; c: Int }

fun testTriple(t: Triple) {
    // Discard 'a' and 'c', only capture 'b'
    let Triple { a: _, b, c: _ } = t;
    dump(b);
}

contract Test {
    receive() {
        testTriple(Triple { a: 1, b: 2, c: 3 });
    }
}

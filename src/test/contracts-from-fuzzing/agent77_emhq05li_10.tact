// Test 10: Wildcard in destructuring via alias syntax
struct Triple {
    a: Int;
    b: Int;
    c: Int;
}

fun sumTriple(t: Triple): Int {
    // Discard field b using aliasing to _
    let Triple { a, b: _, c } = t;
    return a + c;
}

contract Test {
    receive() {
       // Expected: 1 + 3 = 4
       dump(sumTriple(Triple { a: 1, b: 2, c: 3 }));
    }
}

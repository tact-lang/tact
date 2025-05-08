struct Many { a: Int; b: Int; c: Int; d: Int }

fun testRest(): Int {
    // Destructuring assignment using rest operator to ignore remaining fields
    let Many { a, .. } = Many { a: 10, b: 20, c: 30, d: 40 };
    return a; // Expected: 10
}

contract Test {
    receive() {
        dump(testRest());
    }
}

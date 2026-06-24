struct Pair { a: Int; b: Int }

fun testDestructuring(): Int {
    // Valid use: using discard in destructuring to ignore 'b'
    let Pair { a, b: _ } = Pair { a: 1, b: 2 };
    return a;
}

contract TestDestructuring {
    receive() {
        dump(testDestructuring());
    }
}

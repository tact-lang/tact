struct Pair {
    a: Int;
    b: Int;
}

fun testDestructure() {
    let p: Pair = Pair{ a: 10, b: 20 };
    let Pair { a, .. } = p;
    dump(a); // Expected output: 10
}

fun runTest() {
    testDestructure();
}

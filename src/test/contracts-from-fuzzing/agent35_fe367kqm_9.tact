extends mutates fun inc(self: Int) {
    self += 1;
}

fun runTest() {
    let x = 10;
    x.inc();
    dump(x); // Expected output: 11
}

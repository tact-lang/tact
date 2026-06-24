contract TestTonValid {
    // Testing compile-time function ton with exactly one nanoToncoin value
    a: Int = ton("0.000000001");

    receive() {}
}

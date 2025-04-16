contract TestTonValid {
    // Testing valid ton argument: "1" should produce 10^9 nanoToncoins
    value: Int = ton("1");

    receive() {}
}

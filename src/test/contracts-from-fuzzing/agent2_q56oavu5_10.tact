contract TestInvalidTon {
    // Testing invalid usage of ton() with a non-integer string
    const BADTON: Int = ton("1.2");

    // Dummy receiver
    receive() { return; }
}

contract Test {
    // Testing ton() with spaces around the numeric value. Expected behavior: either a compile-time error or proper trimming to produce a valid value.
    value: Int = ton(" 1 ");
    receive() {}
}

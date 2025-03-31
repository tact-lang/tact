contract Test {
    // Testing ton() with a negative value; expected to trigger a compile-time error since Toncoin cannot be negative
    value: Int = ton("-1");
    receive() {}
}

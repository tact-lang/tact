contract Test8 {
    // Testing ton() with a negative value string, expecting error because toncoin cannot be negative
    v: Int = ton("-1");

    // Minimal receive function
    receive() {}
}

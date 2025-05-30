contract TestTonWhitespace {
    // Testing ton compile-time function with leading/trailing whitespace
    // Behavior unclear from docs: Expected to trim the string or fail? 
    value: Int = ton(" 1 ");

    // Dummy receive function
    receive () {}
}

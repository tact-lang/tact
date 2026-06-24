fun discardParam(_: Int): Int {
    // The parameter _ is intentionally discarded and cannot be used
    return 42;
}

contract Example {
    receive() {
        // Calling function that uses a wildcard parameter
        discardParam(100);
    }
}

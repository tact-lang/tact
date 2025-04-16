contract TestChainedCalls {
    receive() {
        // Testing function call chaining on expressions:
        // Convert the integer literal 42 to a string, then call an extension function on the resulting string.
        let s: String = 42.toString();
        // asComment() is assumed to be an extension on String as per documentation examples
        dump(s.asComment());
    }
}

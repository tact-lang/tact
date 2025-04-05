contract TestExtensionInvocation {
    receive() {
        // Calling extension function toString() on integer literal
        dump(42.toString());
    }
}

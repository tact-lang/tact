contract TestExtensionCall {
    receive() {
        // Calling extension function toString on an integer literal
        let s: String = 42.toString();
        dump(s);
    }
}

contract Test {
    receive() {
        // Test string equality
        if ("foo" == "foo") {
            // Success condition
            return;
        } else {
            throw(1);
        }
    }
}

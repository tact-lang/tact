contract TestEquality {
    receive() {
        // Test string equality
        if ("foo" == "foo") {
            dump(1);
        } else {
            dump(0);
        }
    }
}

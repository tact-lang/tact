contract Test {
    receive() {
        if ("foo" == "foo") {
            // Do nothing
        } else {
            // Should not happen
        }
    }
}

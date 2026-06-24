contract Test {
    receive() {
        let s: String = "foo";
        if (s == "foo") {
            // equality check passed
        } else {
            // equality check failed
        }
    }
}

contract TestStringComparison {
    receive() {
        // Test string literal comparison in control flow
        let s: String = "foo";
        if (s == "foo") {
            // expected branch
            dump(1);
        } else {
            dump(0);
        }
    }
}

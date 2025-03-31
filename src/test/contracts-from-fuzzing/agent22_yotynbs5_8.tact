contract TestOverlap {
    // A contract with overlapping text receivers to test matching precedence
    // Receiver for specific text "hello"
    receive("hello") {
        let a = 1;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        let a = 2;
    }
}

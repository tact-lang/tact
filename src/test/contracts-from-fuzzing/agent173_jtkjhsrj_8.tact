contract Test {
    // Specific text receiver for exact message
    receive("hello") {
        // handle 'hello' message
    }

    // General text receiver for any arbitrary text message
    receive(text: String) {
        // handle any text message
    }

    // Dummy function so that receivers are included in compilation
    get fun test(): Int {
        return 0;
    }
}
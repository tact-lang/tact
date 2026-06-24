contract Test {
    // Internal receiver for text literal "hello"
    receive("hello") {
        // Internal processing
    }

    // External receiver for text literal "hello"
    external("hello") {
        // External processing
    }
}

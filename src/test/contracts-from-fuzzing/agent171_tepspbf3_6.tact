contract Test {
    // Receiver with an underscore parameter (discarding the parameter)
    receive(_: Slice) {
        // No operation using the parameter
    }
}

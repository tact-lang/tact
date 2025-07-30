contract TestUnderscore {
    // Using underscore to discard the parameter
    receive(_: String) {
        // handler body
        let x = 42; // arbitrary computation
    }
}

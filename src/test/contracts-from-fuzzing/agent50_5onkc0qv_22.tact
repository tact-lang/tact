message M1 {
    a: Int;
}

contract Test {
    // Test receiver with underscore for a typed message receiver
    receive(_: M1) {
        // discards received message
    }

    // Fallback binary receiver
    receive(msg: Slice) {
        // fallback handling
    }
}

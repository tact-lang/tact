message UniverseCalls {
    id: Int;
}

contract TestUnderscore {
    // Test receiver using underscore to discard the message parameter
    receive(_: UniverseCalls) {
        // No use of the parameter
        let a = 1;
    }
}

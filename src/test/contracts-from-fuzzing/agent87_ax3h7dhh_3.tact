message(42) UniverseCalls {}

contract TestUnderscore {
    // Using underscore to discard the message parameter
    receive(_: UniverseCalls) {
        // No operation
    }

    // Required empty receiver to process empty messages (prevent exit code 130)
    receive() { }
}

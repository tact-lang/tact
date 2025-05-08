message(42) UniverseCalls {}

contract Test {
    // Using underscore to discard the message parameter
    receive(_: UniverseCalls) {
        // The body is empty, valid receiver
    }
}

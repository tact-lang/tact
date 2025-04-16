message TestMessage {}

contract Test {
    // Using underscore to discard the receiver parameter
    receive(_: TestMessage) {
        // No operation needed
    }
}

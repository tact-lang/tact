// Test 6: Using underscore to discard receiver parameter in a text message receiver
contract Test {
    receive(_: String) {
        // No operation needed, parameter is discarded
    }
}

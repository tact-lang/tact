message(42) UniverseCalls {}

contract Test {
    receive(_: UniverseCalls) {
        // Using underscore parameter to discard receiver parameter
    }
}

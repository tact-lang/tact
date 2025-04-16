message(42) UniverseCalls {}

contract Test {
    receive(_: UniverseCalls) {
        // Discard parameter with underscore
    }
}

message UniverseCalls {}

contract Test {
    // Discarding receiver parameter using underscore
    receive(_: UniverseCalls) {
        // No operation needed
    }
}

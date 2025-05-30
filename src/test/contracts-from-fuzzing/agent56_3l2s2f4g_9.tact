message UniverseCalls {}

contract Test {
    // Test receiver using underscore to discard parameter
    receive(_: UniverseCalls) {
        10;
    }
}

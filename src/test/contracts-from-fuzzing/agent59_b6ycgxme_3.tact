message UniverseCalls {}

contract Test {
    receive(_: UniverseCalls) {
        // Allowed: wildcard parameter discarding the message
    }
}

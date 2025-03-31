message UniverseCalls {}

contract Test {
    // Valid usage: discard parameter in receiver using message type
    receive (_: UniverseCalls) {}
}

message UniverseCalls {}

contract TestValid {
    // Valid usage: discard value in a message receiver parameter
    receive(_: UniverseCalls) {}
}

message UniverseCalls {}

contract Test {
    // Valid usage: using wildcard as receiver parameter to indicate discarding of the message value
    receive (_: UniverseCalls) {}
}

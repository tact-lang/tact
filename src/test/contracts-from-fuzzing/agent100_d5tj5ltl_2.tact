message(42) UniverseCalls {}

contract Test {
    // Valid usage: receiver with a discarded parameter (wildcard) with a message type
    receive(_: UniverseCalls) {}
}

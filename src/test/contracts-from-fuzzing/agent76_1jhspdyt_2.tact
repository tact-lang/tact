message Dummy {}

contract Test {
    // Valid usage: wildcard as receiver parameter when using a message type
    receive(_: Dummy) {}
}
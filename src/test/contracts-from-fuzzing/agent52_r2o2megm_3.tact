message TestMessage {}

contract Test {
    // Valid usage: wildcard as discard parameter in a receiver, matching documentation 
    receive (_: TestMessage) {}
}

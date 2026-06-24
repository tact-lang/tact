message MyMsg {}

contract Test {
    // Valid: using wildcard for receiver parameter with a message type
    receive(_: MyMsg) {}
}

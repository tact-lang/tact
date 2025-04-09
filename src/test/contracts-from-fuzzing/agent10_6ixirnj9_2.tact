message TestMsg {}

contract Test {
    // A1: Valid usage: discard parameter in receive for a message type
    receive(_: TestMsg) {
    }
}

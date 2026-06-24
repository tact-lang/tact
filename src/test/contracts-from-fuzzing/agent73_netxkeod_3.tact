message TestMsg {}

contract ReceiverValid1 {
    // Valid usage: wildcard in receiver parameter using a message type
    receive(_: TestMsg) {
    }
}

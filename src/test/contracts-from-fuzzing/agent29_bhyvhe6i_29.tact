message TestMessage {
    x: Int;
}

contract TestContract {
    receive(msg: TestMessage) {
        let y = msg.x;
    }
}
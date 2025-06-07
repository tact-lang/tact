message TestMessage {
    data: Int;
}

contract Test {
    receive(msg: TestMessage) {
        let m: TestMessage = TestMessage { data: 5};
    }
}
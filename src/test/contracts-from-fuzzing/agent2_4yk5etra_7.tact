message TestMessage {
    value: Int as uint8;
}

contract TestMessageReceiver {
    fun run() {
        let m: TestMessage = TestMessage{ value: 42 };
        dump(m.value); // expected output: 42
    }
    receive() {
        self.run();
    }
}

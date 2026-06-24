message(0xABCD1234) Msg {
    count: Int;
}

contract TestContract {
    msgField: Msg;

    init() {
        self.msgField = Msg{ count: 123 };
    }

    receive() {
        self.msgField = Msg{ count: 456 };
    }
}
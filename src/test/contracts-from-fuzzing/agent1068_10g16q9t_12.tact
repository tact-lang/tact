message(123) Msg {
    val: Int;
}

contract TestContract {
    lastMsg: Msg;

    init() {
        self.lastMsg = Msg{ val: 77 };
    }

    receive() {
        self.lastMsg = self.lastMsg;
    }
}

message(1) Msg {
    data: Int;
}

contract TestContract {
    lastMsg: Msg;    // persistent var is message struct

    init() {
        self.lastMsg = Msg{ data: 777 };
    }
}
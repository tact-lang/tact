message(0x1) Msg {
    val: Int;
}

contract TestContract {
    optMsg: Msg?;
    init() {
        self.optMsg = Msg{ val: 77 };
    }
}
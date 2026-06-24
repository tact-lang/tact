message(123) Msg {
    x: Int;
}

contract TestContract {
    msg: Msg;

    init() {
        self.msg = Msg{ x: 4 };
    }
}
message(100) Msg {
    code: Int;
    data: String;
}

struct Wrapper {
    value: Int;
    msg: Msg;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            value: 7,
            msg: Msg{ code: 42, data: "ping" },
        };
    }

    receive() {}
}
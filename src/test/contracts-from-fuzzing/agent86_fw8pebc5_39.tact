// struct holding message which holds struct
struct Inner {
    x: Int;
}

message(1) Msg {
    y: Int;
    inn: Inner;
}

struct Wrap {
    msg: Msg;
}

contract C {
    w: Wrap;
    init() {
        self.w = Wrap{
            msg: Msg{ y:42, inn:Inner{ x:1 } }
        };
    }
}
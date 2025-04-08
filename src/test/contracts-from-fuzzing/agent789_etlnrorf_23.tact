message MsgA {
    x: Int;
}

message MsgB {
    y: Bool;
}

struct Container {
    mA: MsgA;
    mB: MsgB;
}

contract MultipleMsgFields {
    data: Container;
    init() {
        self.data = Container{
            mA: MsgA{x: 7},
            mB: MsgB{y: true}
        };
    }
}
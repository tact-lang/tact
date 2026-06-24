message(1) MsgA {
    x: Int;
}

message(2) MsgB {
    y: Bool;
}

struct Wrapper {
    m1: MsgA;
    m2: MsgB;
}

contract MessageInStructTest {
    data: Wrapper;
    init() {
        self.data = Wrapper {
            m1: MsgA { x: 10 },
            m2: MsgB { y: true }
        };
    }
}
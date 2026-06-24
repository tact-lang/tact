struct MsgContainer {
    m1: M1;
    m2: M2;
}

message(100) M1 {
    x: Int;
}

message(200) M2 {
    y: Int;
}

contract MessageInStruct {
    cont: MsgContainer;

    init() {
        self.cont = MsgContainer {
            m1: M1 { x: 1 },
            m2: M2 { y: 2 },
        };
    }
}

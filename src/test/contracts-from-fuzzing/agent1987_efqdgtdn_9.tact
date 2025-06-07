message(123) Msg1 {
    x: Int;
}

message(456) Msg2 {
    y: Bool;
}

struct Wrap {
    m1: Msg1;
    m2: Msg2;
}

contract MessageWrap {
    w: Wrap;
    init() {
        self.w = Wrap{
            m1: Msg1{x: 111},
            m2: Msg2{y: false}
        };
    }
}
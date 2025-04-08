message(0x1) M1 {
    f: Int;
}

message(0x2) M2 {
    m1: M1;
}

contract MessageInMessage {
    m: M2;

    init() {
        self.m = M2{ m1: M1{f:5} };
    }
}
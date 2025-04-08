struct S2 {
    f: Int;
}

message(100) M1 {
    x: Int;
}

contract StructAndMessage {
    s: S2;
    m: M1;

    init() {
        self.s = S2{f:1};
        self.m = M1{x:2};
    }
}

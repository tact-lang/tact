struct S {
    int1: Int as int1;
    uint1: Int as uint1;
    int17: Int as int17;
    uint17: Int as uint17;
    int257: Int as int257;
}

contract WeirdInts {
    s: S;

    init() {
        self.s = S{
            int1: 0,
            uint1: 1,
            int17: 20,
            uint17: 21,
            int257: 22
        };
    }
}
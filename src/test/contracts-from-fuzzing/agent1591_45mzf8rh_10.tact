struct Tiny {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
}

contract TinyInts {
    smalls: Tiny;

    init() {
        self.smalls = Tiny{a: 1, b: 2, c: 3};
    }
}
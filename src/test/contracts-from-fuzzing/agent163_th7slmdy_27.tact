struct Packed {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
}

contract BitPackedStruct {
    s: Packed;
    init() {
        self.s = Packed{ a:1, b:2, c:3, d:4 };
    }
}
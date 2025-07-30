struct Packed {
    i8: Int as int8;
    u4: Int as uint4;
    b: Bool;
}

contract Test {
    p: Packed;

    init() {
        self.p = Packed{ i8: -7, u4: 15, b: true };
    }
}
struct VarWidths {
    a: Int as int64;
    b: Int as uint32;
    c: Int as uint4;
    d: Int;
}

contract SerializeEdge {
    data: VarWidths;

    init() {
        self.data = VarWidths{
            a: -42,
            b: 123456,
            c: 7,
            d: 999999
        };
    }
}
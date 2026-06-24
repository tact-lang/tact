struct Bounded {
    a: Int as uint4;
    b: Int as int8;
}

contract RangeEdge {
    data: Bounded;
    init() {
        self.data = Bounded{ a: 31, b: 127 }; // invalid > max
        self.data = Bounded{ a: 15, b: -128 }; // valid range
    }
}
struct Narrow {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int16;
    d: Int as uint1;
}

contract NarrowSerialize {
    data: Narrow;
    init() {
        self.data = Narrow{ a: 5, b:15, c:-12, d:1 };
    }
}
struct TinyInts {
    a: Int as int1;  // -1..0
    b: Int as uint1; // 0..1
    c: Int as int2;  // -2..1
    d: Int as uint2; // 0..3
}

contract MiniSerialize {
    tiny: TinyInts;

    init() {
        self.tiny = TinyInts{
            a: -1,
            b: 1,
            c: -2,
            d: 3
        };
    }
}
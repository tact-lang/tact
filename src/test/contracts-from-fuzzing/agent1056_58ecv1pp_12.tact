struct SmallPrimitives {
    a: Int as int4;
    b: Int as uint3;
    c: Int as int5;
    d: Int as uint6;
    e: Int as int7;
    f: Int as uint8;
}

contract FineSerialization {
    s: SmallPrimitives;

    init() {
        self.s = SmallPrimitives{
            a: -5,
            b: 7,
            c: -10,
            d: 55,
            e: -50,
            f: 255,
        };
    }
}
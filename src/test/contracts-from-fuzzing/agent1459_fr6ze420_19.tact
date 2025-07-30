// Struct with multiple serialization annotated fields, some optional
struct SerializeOpts {
    a: Int as uint4;
    b: Int? as uint8;
    c: Int as int16;
    d: Int? as int32;
}

contract SerializeAnnotOpt {
    s: SerializeOpts;

    init() {
        self.s = SerializeOpts{
            a: 7,
            b: null,
            c: -10,
            d: 100000
        };
    }
}
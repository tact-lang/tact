// Int field serialized in various integer formats
struct SerInts {
    a: Int as uint4;
    b: Int as uint32;
    c: Int as int64;
    d: Int as int256;
}

contract SerializeInts {
    data: SerInts;

    init() {
        self.data = SerInts{ a:1, b:2, c:-3, d:-4 };
    }
}

struct Inner {
    a: Int as uint32;
    b: Int as int32;
    c: Int;
}

struct Mid {
    x: Int as uint64;
    inner: Inner?;
}

struct OuterBig {
    y: Int;
    mid: Mid?;
}

contract DeepComplex {
    storage: OuterBig;

    init() {
        self.storage = OuterBig{
            y: 1,
            mid: null
        };
    }
}
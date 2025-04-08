struct InnerMost {
    a: Int as uint8;
    b: Int as int16;
}

struct Inner {
    x: Int as uint64;
    y: Bool?;
    z: InnerMost;
}

contract SerializeNest {
    data: Inner;

    init() {
        self.data = Inner{
            x: 999,
            y: true,
            z: InnerMost{
                a: 12,
                b: -34,
            },
        };
    }
}
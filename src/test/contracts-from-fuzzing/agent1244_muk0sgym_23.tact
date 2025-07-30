struct InnerS {
    x: Int as uint8;
    y: Int as int64;
}

struct OuterS {
    a: Int as int257;
    inner: InnerS;
    b: Int as uint32;
}

contract NestedSerializationHints {
    data: OuterS;

    init() {
        self.data = OuterS{
            a: -123,
            inner: InnerS{ x: 255, y: -42 },
            b: 123456,
        };
    }
}

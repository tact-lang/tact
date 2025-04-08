struct InnerAnn {
    a: Int as int8;
    b: Int as uint16;
    c: Int as uint32;
}

struct OuterAnn {
    inner: InnerAnn;
    d: Int as int64;
    e: Int as uint4;
}

contract NestedSerializationAnn {
    data: OuterAnn;

    init() {
        self.data = OuterAnn{
            inner: InnerAnn{a: -5, b: 42, c: 123456},
            d: -789,
            e: 9,
        };
    }
}
struct InnerSer {
    a: Int as uint32;
    b: Int as int64;
}

struct OuterSer {
    foo: InnerSer;
    bar: Int as uint8;
}

contract SerializeNested {
    data: OuterSer;

    init() {
        self.data = OuterSer{
            foo: InnerSer{ a: 123, b: -123 },
            bar: 7
        };
    }
}
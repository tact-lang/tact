struct InnerSer {
    x: Int as uint7;
    y: Int as int10;
}

struct OuterSer {
    foo: Int as uint3;
    bar: Int as int11;
    nested: InnerSer;
}

contract NestedSerializationHints {
    data: OuterSer;

    init() {
        self.data = OuterSer{
            foo: 7,
            bar: -100,
            nested: InnerSer{
                x: 70,
                y: -300,
            },
        };
    }
}
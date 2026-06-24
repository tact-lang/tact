struct Inner {
    foo: Int as uint8;
}

struct Outer {
    bar: Inner;
    baz: String;
}

contract NestedSerializedStruct {
    data: Outer?;

    init() {
        self.data = Outer{
            bar: Inner{ foo: 200 },
            baz: "hello"
        };
    }
}
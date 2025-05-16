struct Inner {
    foo: Int?;
    bar: Bool;
}

struct Outer {
    nested: Inner;
    text: String;
    flag: Bool?;
}

contract DeepNested {
    field: Outer;

    init() {
        self.field = Outer{
            nested: Inner{ foo: null, bar: true },
            text: "test",
            flag: false
        };
    }
}
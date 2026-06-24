struct Inner {
    foo: Int;
    bar: String;
}

struct Outer {
    nested: Inner;
    optional: Bool?;
}

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{ foo: 9, bar: "abc" },
            optional: null
        };
    }
}

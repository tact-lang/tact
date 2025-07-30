struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    nested: Inner;
    baz: String;
}

contract DeepNestedTest {
    persistent: Outer;
    init() {
        self.persistent = Outer{
            nested: Inner{ foo: 1, bar: null },
            baz: "hello"
        };
    }
}
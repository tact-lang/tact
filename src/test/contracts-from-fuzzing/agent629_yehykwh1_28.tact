struct OptionalNested {
    foo: Inner?;
}

struct Inner {
    bar: String;
    baz: Int;
}

contract Test {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ foo: null };
    }
}

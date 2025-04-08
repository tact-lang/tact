struct InnerMost {
    baz: String;
}

struct Middle {
    foo: Bool;
    bar: InnerMost;
}

contract NestedStrings {
    store: Middle;
    init() {
        self.store = Middle{ foo: true, bar: InnerMost{ baz: "hello" } };
    }
}
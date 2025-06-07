contract ComposeNestedDirect {
    inner: Inner;

    init() {
        self.inner = Inner{ id:5, nested: Nested{ text:"ok" } };
    }
}

struct Inner {
    id: Int;
    nested: Nested;
}

struct Nested {
    text: String;
}

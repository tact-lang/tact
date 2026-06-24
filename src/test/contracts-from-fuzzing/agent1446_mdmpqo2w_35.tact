struct InnerA {
    x: Int;
    y: Bool;
}

struct Wrap {
    inner: InnerA;
}

contract OptFields {
    foo: Wrap?;
    bar: Int?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}

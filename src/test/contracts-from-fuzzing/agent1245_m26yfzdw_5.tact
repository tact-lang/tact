struct Embed {
    a: Int;
    b: Bool;
}

contract OptInPersistent {
    foo: Int?;
    bar: Embed?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}

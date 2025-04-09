struct Inner {
    x: Int?;
}

contract OptionalDefaultInner {
    foo: Inner = Inner{ x:null };

    init() {
        self.foo = Inner{ x:42 };
    }
}

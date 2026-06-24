struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionals {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: null,
            b: false,
            c: null
        };
    }
}

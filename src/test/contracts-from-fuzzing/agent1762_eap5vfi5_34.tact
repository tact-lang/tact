struct Wrapper {
    inner: InnerOption?;
}

struct InnerOption {
    foo: Int?;
    bar: Bool?;
}

contract MultiNestedOpts {
    val: Wrapper;
    init() {
        self.val = Wrapper{ inner: InnerOption{ foo: null, bar: true } };
    }
}
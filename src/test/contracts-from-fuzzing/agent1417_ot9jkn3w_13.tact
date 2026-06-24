struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptionalChain {
    inner: NestedOptional?;
    num: Int;

    init() {
        self.inner = NestedOptional{
            foo: 55,
            bar: null
        };
        self.num = 123;
    }
}
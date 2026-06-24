struct Inner {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalNested {
    innerData: Inner;

    init() {
        self.innerData = Inner{
            foo: null,
            bar: true,
            baz: null
        };
    }
}
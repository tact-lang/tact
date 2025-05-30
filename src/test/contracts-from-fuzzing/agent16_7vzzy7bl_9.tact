struct InnerOptional {
    foo: Int?;
    bar: Bool?;
}

struct OuterOptional {
    inner: InnerOptional?;
    baz: String?;
}

contract NestedOptionals {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null,
            baz: null,
        };
    }
}
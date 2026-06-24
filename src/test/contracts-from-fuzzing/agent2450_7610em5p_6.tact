struct InnerOptional {
    foo: Int?;
    bar: Bool?;
}

struct OuterOptional {
    inner: InnerOptional?;
    baz: String;
}

contract NestedOptionals {
    state: OuterOptional;

    init() {
        self.state = OuterOptional{
            inner: null,
            baz: "hi"
        };
    }
}

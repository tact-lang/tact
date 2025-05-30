struct InnerOpt {
    maybe: Bool?;
    name: String;
}

struct OuterWithOpt {
    inner: InnerOpt;
    extra: Int;
}

contract NestedStructsWithOptionals {
    foo: OuterWithOpt;

    init() {
        self.foo = OuterWithOpt{
            inner: InnerOpt{ maybe: null, name: "x" },
            extra: 7
        };
    }
}
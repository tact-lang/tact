struct Inner {
    foo: Int = 11;
    bar: String? = null;
}

struct Container {
    s1: Inner;
    s2: Inner?;
}

contract ReuseMixedOptional {
    field: Container;

    init() {
        self.field = Container{
            s1: Inner{ foo: 42, bar: "abc" },
            s2: null,
        };
    }
}
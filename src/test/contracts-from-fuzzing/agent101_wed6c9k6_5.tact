struct Outer {
    inner: Inner;
}

struct Inner {
    deeper: Deeper;
}

struct Deeper {
    a: Int;
    b: Bool;
    c: String;
    d: NestedOptional?;
}

struct NestedOptional {
    value: Int;
}

contract ComplexNested {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{
                deeper: Deeper{
                    a: 123,
                    b: true,
                    c: "nested",
                    d: NestedOptional{value: 999},
                },
            },
        };
    }
}
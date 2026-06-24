struct OptionalDeeply {
    foo: Int?;
    bar: Bar?;
}

struct Bar {
    nested: Baz?;
}

struct Baz {
    deeper: Quux?;
}

struct Quux {
    value: Bool;
}

contract DeepOptionals {
    s: OptionalDeeply;

    init() {
        self.s = OptionalDeeply{
            foo: null,
            bar: Bar{
                nested: Baz{
                    deeper: Quux{
                        value: true,
                    },
                },
            },
        };
    }
}
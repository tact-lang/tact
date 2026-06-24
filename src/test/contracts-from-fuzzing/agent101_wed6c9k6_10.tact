struct NestedOptionals {
    foo: Foo?;
}

struct Foo {
    bar: Bar?;
}

struct Bar {
    baz: Int?;
}

contract DeepOptional {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            foo: Foo{
                bar: Bar{
                    baz: null,
                },
            },
        };
    }
}
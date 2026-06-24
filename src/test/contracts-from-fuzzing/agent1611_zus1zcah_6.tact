struct NestedOptionals {
    foo: Foo?;
}

struct Foo {
    bar: Bar?;
}

struct Bar {
    baz: Int?;
}

contract NestedOptionalTest {
    data: NestedOptionals;
    init() {
        self.data = NestedOptionals{
            foo: Foo{
                bar: Bar{
                    baz: null
                }
            }
        };
    }
}
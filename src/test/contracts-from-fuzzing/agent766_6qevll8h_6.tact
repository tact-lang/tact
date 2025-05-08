struct NestedOptional {
    foo: Foo?;
}

struct Foo {
    bar: Bar?;
}

struct Bar {
    val: Int;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: Foo{
                bar: Bar{
                    val: 10
                }
            }
        };
    }
}
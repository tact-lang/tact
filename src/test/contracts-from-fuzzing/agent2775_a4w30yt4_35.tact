// Deep optional nested struct
struct Foo {
    bar: Bar?;
}

struct Bar {
    baz: Baz?;
}

struct Baz {
    a: Int?;
    b: Bool?;
}

contract DeepOption {
    foo: Foo;

    init() {
        self.foo = Foo{
            bar: Bar{
                baz: Baz{
                    a: null,
                    b: null
                }
            }
        };
    }
}

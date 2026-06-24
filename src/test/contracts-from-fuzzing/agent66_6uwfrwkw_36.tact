struct Foo {
    a: Int;
}

struct Bar {
    foo: Foo;
}

struct Baz {
    bar: Bar;
}

contract ChainDefault {
    val: Baz;

    init() {
        self.val = Baz{
            bar: Bar{
                foo: Foo{
                    a:77
                }
            }
        };
    }
}
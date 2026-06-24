struct Container {
    inner: Inner;
}

struct Inner {
    nested: Nested;
}

struct Nested {
    foo: Foo;
}

struct Foo {
    bar: Bar;
}

struct Bar {
    x: Int;
}

contract UltraDeep {
    val: Container;

    init() {
        self.val = Container{
            inner: Inner{
                nested: Nested{
                    foo: Foo{
                        bar: Bar{ x:123 }
                    }
                }
            }
        };
    }
}
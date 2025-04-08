struct Foo {
    f: Int;
}

struct Bar {
    b: Bool;
}

struct Baz {
    s: String;
}

struct Container {
    foo: Foo;
    bar: Bar;
    baz: Baz;
}

contract NestedStructs {
    big: Container;
    init() {
        self.big = Container{foo: Foo{f:5}, bar: Bar{b:true}, baz: Baz{s:"x"}};
    }
}
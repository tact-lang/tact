struct Foo {
    bar: Bar;
}

struct Bar {
    baz: Int;
}

contract MultiLvl {
    s: Foo;
    init() {
        self.s = Foo{
            bar: Bar{ baz: 11 }
        };
    }
}
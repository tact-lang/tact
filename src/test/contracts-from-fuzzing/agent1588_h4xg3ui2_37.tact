struct Deep {
    foo: Foo;
}

struct Foo {
    bar: Bar;
}

struct Bar {
    baz: Int;
}

contract NestedTest {
    deep: Deep;
    
    init() {
        self.deep = Deep{ foo: Foo { bar: Bar { baz: 123 } } };
    }
}
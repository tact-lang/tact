struct DeepInits {
    foo: Foo;
}

struct Foo {
    bar: Bar;
}

struct Bar {
    baz: Int = 42;
}

contract Test {
    deep: DeepInits;

    init() {
        self.deep = DeepInits{ foo: Foo{ bar: Bar{} } };
    }
}
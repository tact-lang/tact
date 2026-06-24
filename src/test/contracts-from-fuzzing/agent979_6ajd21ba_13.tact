contract JustFieldsAndNestedStructs {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ x: 1, y: null };
        self.bar = Bar{ z: 42 };
    }
}

struct Foo {
    x: Int; 
    y: Int?;
}

struct Bar {
    z: Int;
}
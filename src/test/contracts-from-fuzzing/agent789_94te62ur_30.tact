contract ComposeStructsTest {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo { a:1, b:true };
        self.bar = Bar { x:2, y:false };
    }
}

struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    x: Int;
    y: Bool;
}
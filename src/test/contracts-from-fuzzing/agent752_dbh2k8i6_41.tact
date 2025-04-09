struct Foo {
    a: Int;
    b: Bool;
    c: String;
}

struct Bar {
    foo: Foo;
    opt: Int?;
}

contract MultipleStructLayers {
    bar: Bar;

    init() {
        self.bar = Bar{
            foo: Foo{ a:1, b:true, c:"c" },
            opt: null
        };
    }
}
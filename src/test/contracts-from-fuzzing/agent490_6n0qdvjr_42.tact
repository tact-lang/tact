struct Foo {
    a: Int;
    b: String;
}

struct Bar {
    c: Int?;
    d: Foo;
}

contract MixDeep {
    bar: Bar;
    init() {
        self.bar = Bar{ c: null, d: Foo{ a: 1, b: "hi" } };
    }
}
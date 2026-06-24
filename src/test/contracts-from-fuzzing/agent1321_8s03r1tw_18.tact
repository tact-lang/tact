struct Foo {
    x: Int;
    y: Int;
}

struct Bar {
    a: Bool;
    b: String;
}

contract TwoStructs {
    fooField: Foo;
    barField: Bar;
    init() {
        self.fooField = Foo{ x: 1, y: 2 };
        self.barField = Bar{ a: true, b: "hi" };
    }
}
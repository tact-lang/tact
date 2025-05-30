struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    s: String;
    c: Cell;
}

contract MultiNestedFields {
    fooData: Foo;
    barData: Bar;

    init() {
        self.fooData = Foo{a: 1, b: true};
        self.barData = Bar{s: "hi", c: emptyCell()};
    }
}
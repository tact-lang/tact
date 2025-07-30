// Nested optional struct as optional contract field
struct Foo {
    x: Int;
}

contract TestContract {
    optNested: Foo?;

    init() {
        self.optNested = Foo{x: 5};
    }
}

struct Foo {
    a: Int;
    b: Bool;
}
struct Bar {
    f: Foo;
}

contract StructInsideContract {
    bar: Bar;
    init() {
        self.bar = Bar{ f: Foo{ a: 1, b: true } };
    }
}
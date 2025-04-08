struct Foo {
    x: Int;
    y: Bool;
}

struct Bar {
    x: String;
    y: Address;
}

contract DupStructFields {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ x: 1, y: true };
        self.bar = Bar{ x: "test", y: myAddress() };
    }
}

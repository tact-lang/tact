struct Foo {
    a: Int;
    b: Bool;
    c: Address;
}

contract Test {
    data: Foo;

    init() {
        self.data = Foo{a: 1, b: true, c: myAddress()};
    }
}

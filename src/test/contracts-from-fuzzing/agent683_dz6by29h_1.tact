struct Foo {
    a: Int;
}

contract Test {
    data: Foo;

    init() {
        self.data = Foo{ a: 1 };
    }
}
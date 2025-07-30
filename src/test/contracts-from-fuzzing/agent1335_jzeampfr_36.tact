struct Bar {
    b: Int;
}

struct Foo {
    foo: Bar;
}

contract Contr {
    data: Foo;

    init() {
        self.data = Foo{ foo: Bar{ b: 1 } };
    }
}
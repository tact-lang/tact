struct Foo {
    bar: Int;
}

contract ReassignNested {
    nested: Foo;

    init() {
        self.nested = Foo{ bar:1 };
        self.nested = Foo{ bar:2 };
    }
}
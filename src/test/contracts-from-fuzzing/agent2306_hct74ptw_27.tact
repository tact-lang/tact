struct Foo {
    x: Int;
}

contract SameNameDiffTypes {
    foo1: Foo;
    foo2: Foo?;

    init() {
        self.foo1 = Foo{ x:1 };
        self.foo2 = null;
    }
}

struct Foo { val: Int; }

contract InitNested {
    foo: Foo;

    init() {
        self.foo = Foo{ val: 99 };
    }
}
message(12345) Foo {
    val: Int;
}

message(12345) Bar {
    flag: Bool;
}

contract DuplicateOpMsg {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ val: 1 };
        self.bar = Bar{ flag: true };
    }
}
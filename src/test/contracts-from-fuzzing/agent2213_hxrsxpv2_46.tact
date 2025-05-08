struct Foo {
    val: Int?;
}

contract NullDefaultStruct {
    foo: Foo;

    init() {
        self.foo = Foo{ val: null };
    }
}

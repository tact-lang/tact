struct Foo {
    a: Int;
    b: Bool;
}

contract OptStruct {
    foo: Foo?;

    init() {
        self.foo = Foo{a: 1, b:true};
    }
}

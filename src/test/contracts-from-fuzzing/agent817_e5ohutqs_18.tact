struct Bar {
    s: String;
    flag: Bool;
}

struct Foo {
    id: Int;
    nested: Bar;
}

contract Test {
    foo: Foo;

    init() {
        self.foo = Foo{
            id: 42,
            nested: Bar{
                s: "hi",
                flag: true
            }
        };
    }
}
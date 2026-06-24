struct Foo {
    bar: Bool;
    baz: Int?;
    qux: String;
}

contract DiffTypes {
    x: Foo;
    init() {
        self.x = Foo{
            bar: true,
            baz: null,
            qux: "test"
        };
    }
}
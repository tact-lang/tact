struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    foo: NestedOptionals?;

    init() {
        self.foo = NestedOptionals{
            a: 5,
            b: null,
            c: "hello",
        };
    }
}
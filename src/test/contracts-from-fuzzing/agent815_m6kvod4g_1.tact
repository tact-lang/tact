struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestNested {
    foo: Nested;

    init() {
        self.foo = Nested{
            a: 10,
            b: true,
            c: "nested"
        };
    }
}
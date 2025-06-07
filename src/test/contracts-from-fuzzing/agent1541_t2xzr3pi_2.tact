struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract StorageStructTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            a: 1,
            b: true,
            c: "hello",
        };
    }

    receive() {
        self.nested = Nested{
            a: self.nested.a + 1,
            b: !self.nested.b,
            c: "world",
        };
    }
}
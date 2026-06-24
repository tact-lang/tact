struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
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
            a: 2,
            b: false,
            c: "world",
        };
    }
}
struct Nested {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

contract Test2 {
    nested: Nested;

    init() {
        self.nested = Nested{
            a: 123,
            b: false,
            c: myAddress(),
            d: "hello",
        };
    }

    receive() {}
}
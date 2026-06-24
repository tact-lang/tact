struct Nested {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

contract TestContract {
    s: Nested;

    init() {
        self.s = Nested{
            a: 5,
            b: true,
            c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            d: "hi"
        };
    }

    receive() {}
}
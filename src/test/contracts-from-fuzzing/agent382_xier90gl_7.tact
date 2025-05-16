struct Nested {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

contract TestContract {
    s: Nested? = null;

    init() {
        self.s = Nested{
            a: 10,
            b: false,
            c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            d: "x"
        };
    }

    receive() {}
}
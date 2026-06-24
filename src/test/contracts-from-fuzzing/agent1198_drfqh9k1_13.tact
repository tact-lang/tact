struct Special {
    a: Int as int64;
    b: Int? as uint8;
    c: Bool;
    d: String?;
    e: Address;
}

contract SerialMixed {
    s: Special;

    init() {
        self.s = Special{
            a: -123456789,
            b: null,
            c: true,
            d: "x",
            e: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }

    receive() {
        self.s = self.s;
    }
}
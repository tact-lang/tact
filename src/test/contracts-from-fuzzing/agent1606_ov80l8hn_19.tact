struct PrimitivesMixin {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract StructPrimitives {
    nested: PrimitivesMixin;

    init() {
        self.nested = PrimitivesMixin{
            a: 0,
            b: true,
            c: "abc",
            d: myAddress()
        };
    }
}

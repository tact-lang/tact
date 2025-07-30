struct PrimitiveFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

contract MultiPrimitives {
    flds: PrimitiveFields;
    init() {
        self.flds = PrimitiveFields{
            a: 10,
            b: false,
            c: myAddress(),
            d: "abc"
        };
    }
}
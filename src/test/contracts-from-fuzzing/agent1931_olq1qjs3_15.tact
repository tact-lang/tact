struct OptionalComplex {
    a: Bool?;
    b: String?;
    c: Cell?;
    d: Address?;
}

contract OptionalComplexHolder {
    val: OptionalComplex;

    init() {
        self.val = OptionalComplex{
            a: null,
            b: null,
            c: null,
            d: myAddress()
        };
    }
}
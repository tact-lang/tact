struct Complex {
    i: Int;
    flag: Bool;
    addr: Address;
    text: String;
    optionalI: Int?;
    optionalAddr: Address?;
}

contract ComplexStructVar {
    cs: Complex;

    init() {
        self.cs = Complex{
            i: 42,
            flag: false,
            addr: myAddress(),
            text: "test",
            optionalI: null,
            optionalAddr: null
        };
    }
}
struct Complex {
    b1: Bool;
    n1: Int?;
    s1: String;
    b2: Bool;
    s2: String;
    n2: Int?;
}

contract MixedMultiField {
    stuff: Complex;

    init() {
        self.stuff = Complex{
            b1: true,
            n1: 11,
            s1: "a",
            b2: false,
            s2: "b",
            n2: null
        };
    }
}
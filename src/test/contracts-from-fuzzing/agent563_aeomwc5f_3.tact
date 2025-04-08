struct Complex {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract TestComplex {
    record: Complex;

    init() {
        self.record = Complex{ num: null, flag: null, text: null };
    }
}
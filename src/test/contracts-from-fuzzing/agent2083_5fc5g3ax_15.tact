struct Complex {
    intOpt: Int?;
    flag: Bool;
    strOpt: String?;
    num: Int;
}

contract OptionalMix {
    data: Complex;

    init() {
        self.data = Complex{
            intOpt: null,
            flag: false,
            strOpt: null,
            num: 42,
        };
    }
}

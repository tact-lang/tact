struct Complex {
    optNum: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract OptionalsPersist {
    param: Complex;

    init() {
        self.param = Complex{ optNum: null, optStr: null, optBool: null };
    }
}

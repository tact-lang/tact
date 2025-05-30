struct ComplexOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    s: ComplexOpt?;

    init() {
        self.s = null;
    }
}
struct ComplexOpt {
    val: Int?;
    flag: Bool?;
    txt: String?;
}

contract OptionalStructWithOptFields {
    st: ComplexOpt?;

    init() {
        self.st = null;  // omit entire struct, fully optional
    }
}
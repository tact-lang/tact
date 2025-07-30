struct OptFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test8 {
    st: OptFields;

    init() {
        self.st = OptFields{a: null, b: null, c: null};
    }
}

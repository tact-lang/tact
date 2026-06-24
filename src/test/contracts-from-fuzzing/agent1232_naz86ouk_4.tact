struct OptFields {
    a: Int?;
    b: Bool?;
}

contract OptionalStructField {
    opt: OptFields;

    init() {
        self.opt = OptFields{a: null, b: true};
    }
}

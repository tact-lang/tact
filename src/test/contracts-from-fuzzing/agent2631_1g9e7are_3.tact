struct OptFields {
    a: Int?;
    b: Bool?;
}

contract OptFieldsContract {
    vals: OptFields;

    init() {
        self.vals = OptFields{a: null, b: null};
    }
}
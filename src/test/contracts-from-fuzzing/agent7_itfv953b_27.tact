struct OptBool {
    v: Bool?;
}

contract OptBoolField {
    d: OptBool;

    init() {
        self.d = OptBool{ v: null };
    }
}
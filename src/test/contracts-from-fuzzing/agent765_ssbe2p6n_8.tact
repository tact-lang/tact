struct OptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructField {
    inside: OptionalDeep;
    init() {
        self.inside = OptionalDeep{a: null, b: null, c: null};
    }
}
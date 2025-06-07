struct OptionalStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    optional: OptionalStruct;
    init() {
        self.optional = OptionalStruct{ a: null, b: null, c: null };
    }
}
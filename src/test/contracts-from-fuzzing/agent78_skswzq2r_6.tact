struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalPersistent {
    stored: OptStruct?;

    init() {
        self.stored = null;
    }
}
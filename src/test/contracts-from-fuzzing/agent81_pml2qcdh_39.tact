contract NestedOptions {
    // known nested optionals unsupported, so just deep single optionals
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
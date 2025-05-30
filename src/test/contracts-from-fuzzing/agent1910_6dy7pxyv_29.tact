contract OptionalDefaultsMix {
    a: Int?;
    b: Bool? = null;
    c: Address? = null;
    d: String? = "";

    init() {
        self.a = null;
    }
}

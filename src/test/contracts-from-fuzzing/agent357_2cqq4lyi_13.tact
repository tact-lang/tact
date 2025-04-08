contract OptionalDefaults {
    a: Int?;
    b: Bool? = true;
    c: Cell? = null;
    d: String? = "abc";
    e: Slice? = null;
    f: Address? = null;

    init() {
        self.a = null;
    }
}
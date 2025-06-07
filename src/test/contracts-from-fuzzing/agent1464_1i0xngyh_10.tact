contract OptionalDefaults {
    v1: Int?;
    v2: Bool? = null;
    v3: String? = null;
    v4: Address? = null;

    init() {
        self.v1 = null;
        self.v2 = true;
        self.v3 = "abc";
        self.v4 = myAddress();
    }
}

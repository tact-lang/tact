contract MixOptionalsAndDefaults {
    a: Int?;
    b: Bool? = null;
    c: String = "string";
    d: Address;

    init() {
        self.a = 50;
        self.d = myAddress();
    }
}
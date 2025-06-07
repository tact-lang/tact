contract OptionalsWithDefaults {
    a: Int?;
    b: Bool?;
    c: String = "s";
    d: Address;

    init() {
        self.a = null;
        self.b = true;
        self.d = myAddress();
    }
}
contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "s";
    d: Address;

    init() {
        self.b = true;
        self.d = myAddress();
    }
}
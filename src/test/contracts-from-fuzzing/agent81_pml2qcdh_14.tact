contract MixedDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Address;

    init() {
        self.d = myAddress();
    }
}
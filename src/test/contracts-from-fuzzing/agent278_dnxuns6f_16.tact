contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hello";
    d: Address;
    init() {
        self.b = true;
        self.d = myAddress();
    }
}
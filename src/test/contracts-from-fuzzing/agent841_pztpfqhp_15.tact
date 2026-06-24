contract MixedDefault {
    a: Int = 1;
    b: Bool;
    c: String = "abc";
    d: Address;
    init() {
        self.b = true;
        self.d = myAddress();
    }
}

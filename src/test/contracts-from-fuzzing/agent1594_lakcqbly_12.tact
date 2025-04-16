contract MixedPersistent {
    a: Int;
    b: Bool = true;
    c: String;
    d: Address;
    e: Int?;

    init() {
        self.a = 7;
        self.c = "test";
        self.d = myAddress();
        self.e = null;
    }
}
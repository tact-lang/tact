contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = myAddress();
    }
}
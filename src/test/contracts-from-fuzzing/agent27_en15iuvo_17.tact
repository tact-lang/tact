contract MixFields {
    a: Int = 10;
    b: Bool;
    c: String;
    d: Address;

    init() {
        self.b = true;
        self.c = "test";
        self.d = myAddress();
    }
}
contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = "test";
    }
}
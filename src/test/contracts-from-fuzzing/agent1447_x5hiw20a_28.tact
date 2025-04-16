contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "string";
        self.d = myAddress();
    }
}
contract MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "test";
        self.a = myAddress();
    }
}
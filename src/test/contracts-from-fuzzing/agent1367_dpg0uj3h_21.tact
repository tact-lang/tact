contract MixedSimple {
    a: Int;
    b: Bool?;
    c: Address;
    d: Cell?;

    init() {
        self.a = 7;
        self.b = null;
        self.c = myAddress();
        self.d = null;
    }
}
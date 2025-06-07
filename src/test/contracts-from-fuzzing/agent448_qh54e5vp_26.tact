contract DefaultOptionalPrimitives {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
    a: Address? = null;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "abc";
        self.a = myAddress();
    }
}
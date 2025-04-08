contract OnlyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;

    init() {
        self.a = 0;
        self.b = false;
        self.c = myAddress();
        self.d = "foobar";
    }
}
contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
        self.d = "hello";
    }

    receive() {
        self.a = self.a;
    }
}
contract LiteralDefaults {
    a: Int = 17;
    b: Bool = true;
    c: String = "hello";
    d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.a = 42;
        self.b = false;
        self.c = "world";
        self.d = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }

    receive() {}
}
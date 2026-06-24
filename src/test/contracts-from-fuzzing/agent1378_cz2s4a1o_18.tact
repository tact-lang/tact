contract EmptyDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
    receive() {}
}
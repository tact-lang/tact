contract InitOnly {
    a: Int;
    b: Bool;
    c: Address;
    s: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.s = "hi";
    }
}
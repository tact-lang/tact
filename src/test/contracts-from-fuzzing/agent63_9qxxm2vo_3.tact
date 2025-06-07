contract InitAssignsAll {
    a: Int;
    b: Bool;
    c: Address;
    d: String;

    init() {
        self.a = 7;
        self.b = true;
        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.d = "hello";
    }
}
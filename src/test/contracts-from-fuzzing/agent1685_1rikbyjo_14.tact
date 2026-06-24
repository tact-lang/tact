contract InitFields {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
    }
}

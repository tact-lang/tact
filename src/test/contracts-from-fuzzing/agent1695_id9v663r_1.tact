contract Test1 {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
    }
}

contract TestContract {
    a: Int?;
    b: Bool?;
    c: Address?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = myAddress();
    }
}
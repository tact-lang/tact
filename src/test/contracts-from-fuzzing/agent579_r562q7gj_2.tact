contract TestContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Address;

    init() {
        self.a = -42;
        self.b = true;
        self.c = null;
        self.d = "hi";
        self.e = myAddress();
    }
}
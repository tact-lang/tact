contract TestContract {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
    }
}

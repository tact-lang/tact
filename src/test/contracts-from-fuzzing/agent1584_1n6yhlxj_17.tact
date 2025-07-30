contract TestContract {
    a: Int?;
    b: Bool? = null;
    c: Address?;
    d: String? = null;

    init() {}

    receive() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "ok";
    }
}

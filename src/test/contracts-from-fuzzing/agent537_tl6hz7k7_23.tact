contract TestContract {
    s: String?;
    b: Bool?;
    i: Int?;

    init() {
        self.s = "abc";
        self.b = true;
        self.i = 123;
    }

    receive() {
        self.s = null;
        self.b = null;
        self.i = null;
    }
}

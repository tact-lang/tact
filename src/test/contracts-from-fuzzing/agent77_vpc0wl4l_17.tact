contract TrailingSemi {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address;

    init() {
        self.d = myAddress();
    }

    receive() {
        self.a = self.a + 1;
    }
}

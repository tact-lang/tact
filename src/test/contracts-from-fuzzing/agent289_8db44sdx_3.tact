contract TestContract {
    a: Int?;
    b: Bool?;
    c: Address?;

    init() {
        self.a = 7;
        self.b = false;
        self.c = null;
    }

    receive() {}
}
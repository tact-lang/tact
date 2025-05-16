contract AllOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }

    receive() {
        self.a = 1;
    }
}
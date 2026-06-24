contract OptionalReassign {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.a = 5;
        self.b = null;
        self.d = "xyz";
    }
}
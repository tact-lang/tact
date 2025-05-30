contract MessyOptional {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.i = null;
        self.b = true;
        self.s = "hi";
    }
}
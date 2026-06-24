contract CrossOptional {
    a: Int?;
    b: Bool;
    c: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}
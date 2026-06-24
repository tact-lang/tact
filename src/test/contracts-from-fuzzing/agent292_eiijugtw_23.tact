contract OnlyDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";

    init() {
        self.a = 5;
        self.b = true;
        self.c = "hi";
    }
}
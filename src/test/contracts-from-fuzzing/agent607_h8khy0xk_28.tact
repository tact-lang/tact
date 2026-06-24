contract OnlyDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "hello";

    init() {
        self.a = 70;
        self.b = true;
        self.c = "bye";
    }
}
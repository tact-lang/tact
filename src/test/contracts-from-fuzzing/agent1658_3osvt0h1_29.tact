contract OnlyPrimsDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "bye";
    }
}
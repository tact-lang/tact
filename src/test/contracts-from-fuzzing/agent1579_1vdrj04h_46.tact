contract OnlyDefaults2 {
    a: Int = 42;
    b: Bool = false;
    s: String = "hello";
    init() {
        self.a = 5;
        self.b = true;
        self.s = "bye";
    }
}
contract OnlyDefaults {
    a: Int = 100;
    b: Bool = true;
    c: String = "ok";
    init() {
        self.a = 200;
        self.b = false;
        self.c = "updated";
    }
}
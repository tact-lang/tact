contract NoDefaults {
    p1: Int;
    p2: Bool;
    p3: String;

    init() {
        self.p1 = 123;
        self.p2 = true;
        self.p3 = "ok";
    }
}
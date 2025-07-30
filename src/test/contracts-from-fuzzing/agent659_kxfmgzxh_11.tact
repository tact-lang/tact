contract WithDefaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "ok";

    init() {
        self.a = 1;
        self.b = false;
        self.s = "done";
    }
}

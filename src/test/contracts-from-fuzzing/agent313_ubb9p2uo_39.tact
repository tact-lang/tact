contract EmptyInitNoDefaults {
    a: Int;
    b: Bool;
    s: String;

    init() {
        self.a = 0;
        self.b = false;
        self.s = "";
    }
}
contract InitWithoutDefaults {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "val";
    }
}
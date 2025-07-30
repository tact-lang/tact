contract InitDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";

    init() {
        self.a = 2;
        self.b = false;
        self.c = "changed";
    }
}
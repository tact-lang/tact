contract InitDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "init";

    init() {
        self.a = 1;
        self.b = false;
        self.c = "done";
    }
}
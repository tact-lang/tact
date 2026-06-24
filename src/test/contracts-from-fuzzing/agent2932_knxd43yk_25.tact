contract SimpleDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "txt";

    init() {
        self.a = 7;
        self.b = true;
        self.c = "done";
    }
}
contract ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";

    init() {
        self.a = 123;
        self.b = true;
        self.c = "hi";
    }
}
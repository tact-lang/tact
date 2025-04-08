contract InitDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";

    init() {
        self.a = 10;
        self.b = false;
        self.c = "bye";
    }
}
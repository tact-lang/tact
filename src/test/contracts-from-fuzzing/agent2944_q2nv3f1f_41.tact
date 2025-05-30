contract DefaultPersistent {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";

    init() {
        self.a = 5;
        self.b = false;
        self.c = "bye";
    }
}
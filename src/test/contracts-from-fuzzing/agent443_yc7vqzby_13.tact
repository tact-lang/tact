contract DefaultedPersistence {
    a: Int = 5;
    b: Bool = true;
    s: String = "hi";

    init() {
        self.a = 42;
        self.b = false;
        self.s = "bye";
    }
}
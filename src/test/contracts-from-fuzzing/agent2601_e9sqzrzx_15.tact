contract DefaultConflict {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    init() {
        self.a = 6;
        self.b = false;
        self.c = "bye";
    }
}
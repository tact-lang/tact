contract InitDefaultsVsAssignment {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";

    init() {
        self.a = 7;
        self.b = true;
        self.c = "bye";
    }
}
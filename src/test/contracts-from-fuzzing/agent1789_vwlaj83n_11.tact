contract DefaultValues {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";

    init() {
        self.a = 7;
        self.b = false;
        self.c = "bye";
    }
}
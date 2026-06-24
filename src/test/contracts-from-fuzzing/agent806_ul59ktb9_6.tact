contract DefaultValues {
    a: Int = 11;
    b: Bool = true;
    c: String = "abc";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "def";
    }
}
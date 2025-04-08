contract DefaultValues {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";

    init() {
        self.a = 5;
        self.b = false;
        self.c = "xyz";
    }
}
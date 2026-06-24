contract DefaultValues {
    a: Int = 10;
    b: Bool = true;
    c: Int? = null;
    d: String = "hi";

    init() {
        self.a = 5;
        self.b = false;
        self.c = 99;
        self.d = "bye";
    }
}
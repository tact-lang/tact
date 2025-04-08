contract DefaultValues {
    a: Int = 5;
    b: String = "x";
    c: Bool = true;
    d: Int? = null;
    e: Bool? = false;

    init() {
        self.a = 10;
        self.b = "y";
        self.c = false;
        self.d = 20;
        self.e = null;
    }
}
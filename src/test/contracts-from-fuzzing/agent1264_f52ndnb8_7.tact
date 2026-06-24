contract DefaultValues {
    a: Int = -100;
    b: Bool = true;
    c: String = "abc";

    init() {
        // override defaults
        self.a = 200;
        self.b = false;
        self.c = "def";
    }
}
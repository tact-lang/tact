contract DefaultOpt {
    a: Int?;
    b: Bool = false;
    c: Int = 0;
    d: String = "";

    init() {
        self.a = null;
        self.b = true;
        self.c = 123;
        self.d = "hi";
    }
}
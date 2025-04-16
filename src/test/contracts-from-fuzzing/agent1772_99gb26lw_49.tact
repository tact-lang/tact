contract Test49 {
    a: Bool = false;
    b: Bool? = true;
    c: Bool? = null;
    d: String? = null;
    e: Int? = 0;

    init() {
        self.a = true;
        self.b = null;
        self.c = false;
        self.d = "text";
        self.e = null;
    }
}
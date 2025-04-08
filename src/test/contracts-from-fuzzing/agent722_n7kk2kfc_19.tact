contract ManyTypes {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 2;
        self.b = false;
        self.c = "q";
        self.d = 44;
        self.e = true;
        self.f = "r";
    }
}
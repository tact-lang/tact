contract LargePrimitivesAndOptionals {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = 2;
        self.e = false;
        self.f = "y";
    }
}
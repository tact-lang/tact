contract ManyOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;
    g: Int? = null;
    h: Bool? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "ok";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = false;
    }
}

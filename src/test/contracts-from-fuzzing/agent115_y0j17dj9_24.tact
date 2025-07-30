contract ManyPrimitives {
    i: Int = 0;
    b: Bool = true;
    s: String = "";
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.i = 42;
        self.b = false;
        self.s = "test";
        self.oi = null;
        self.ob = null;
        self.os = null;
    }
}
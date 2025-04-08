contract ManyFieldTypes {
    i: Int = 1;
    b: Bool = true;
    s: String = "s";
    n: Int? = null;
    bo: Bool? = null;
    st: String? = null;

    init() {
        self.i = 42;
        self.b = false;
        self.s = "changed";
        self.n = 3;
        self.bo = true;
        self.st = "maybe";
    }
}
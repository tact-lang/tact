contract LargeDefaultMix {
    a: Int = 7;
    b: Bool;
    c: Bool?;
    d: String = "str";
    e: String?;
    f: Int? = null;
    g: Bool? = null;
    h: String? = null;
    i: Int = 42;
    j: Bool = true;
    k: Int?;
    init() {
        self.b = false;
        self.c = null;
        self.e = null;
        self.k = null;
    }
}
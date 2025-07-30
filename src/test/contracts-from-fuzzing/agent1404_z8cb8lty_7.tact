contract ManyPersistentFields {
    a: Int = 1;
    b: String = "b";
    c: Bool = true;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
    g: Int = 0;
    h: String = "h";
    i: Bool = false;
    j: Int? = null;
    k: String? = null;
    l: Bool? = null;
    m: Int = -1;
    n: String = "n";
    o: Bool = true;

    init() {
        self.a = 42;
        self.d = 7;
        self.e = "test";
        self.f = true;
    }
}

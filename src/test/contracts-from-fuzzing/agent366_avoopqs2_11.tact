contract ManyVars {
    a: Int = 1;
    b: Bool = true;
    c: String = "X";
    d: Int?;
    e: String?;
    f: Bool = false;
    g: Int = 123;
    h: String = "Y";
    i: Bool = true;
    j: Int?;

    init() {
        self.d = null;
        self.e = null;
        self.j = null;
    }
}
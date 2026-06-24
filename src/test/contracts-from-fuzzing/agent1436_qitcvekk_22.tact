contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int = 2;
    e: Bool = false;
    f: String = "y";
    g: Int = 3;
    h: Bool = true;
    i: String = "z";
    j: Int = 4;
    k: Bool = false;
    l: String = "w";

    init() {
        self.a = 9;
        self.f = "changed";
        self.k = true;
    }
}
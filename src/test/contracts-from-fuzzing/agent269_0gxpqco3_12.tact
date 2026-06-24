contract ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = true;
    g: Bool = false;
    h: String = "x";
    i: String = "y";
    j: String = "z";

    init() {
        self.a = 10;
        self.j = "last";
    }
}
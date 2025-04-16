contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: Int = -5;
    f: Bool = false;
    g: Int?;
    h: Bool?;
    i: Int = 0;
    j: Bool = true;

    init() {
        self.c = null;
        self.d = null;
        self.g = null;
        self.h = null;
    }
}

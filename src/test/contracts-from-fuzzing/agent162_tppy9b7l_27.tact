contract MixDefaultsOptionals {
    a: Int = 1;
    b: Int?;
    c: Int? = null;
    d: Bool = false;
    e: Bool?;
    f: Bool? = null;
    g: String = "x";
    h: String?;
    i: String? = null;
    init() {
        self.b = 2;
        self.e = true;
        self.h = "y";
    }
}
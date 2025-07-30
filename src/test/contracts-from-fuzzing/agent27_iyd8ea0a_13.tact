contract ManyBasicFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int = 4;
    e: Bool = true;
    f: String = "xyz";
    g: Int?;
    h: String?;

    init() {
        self.g = null;
        self.h = null;
    }
}
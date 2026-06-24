contract Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int?; // should default to null
    e: String?; // default to null

    init() {
        self.a = 10;
        self.b = true;
        self.c = "xyz";
        self.d = 5;
        self.e = null;
    }
}

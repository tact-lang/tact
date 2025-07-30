contract LargeOptionalMix {
    a: Int?;
    b: Bool; 
    c: String?;
    d: Bool?;
    e: Int;
    f: String;
    g: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = 9;
        self.f = "hi";
        self.g = false;
    }
}

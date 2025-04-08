contract NoStructsJustFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
    e: Bool = false;
    f: String = "txt";

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = true; 
        self.f = "xyz";
    }
}
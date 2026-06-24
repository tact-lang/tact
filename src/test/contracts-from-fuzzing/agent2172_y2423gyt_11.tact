contract Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
    d: Int?; // implicitly null
    e: Bool?; // implicitly null
    f: String?; // implicitly null

    init() {
        self.a = 11;
        self.b = false;
        self.c = "changed";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
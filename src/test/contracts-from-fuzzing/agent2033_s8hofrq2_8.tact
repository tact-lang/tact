contract Test {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String?;
    
    init() {
        self.d = null;
        self.e = true;
        self.f = null;
    }
}
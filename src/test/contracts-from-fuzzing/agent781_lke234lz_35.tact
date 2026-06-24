contract OnlyOptionalFields {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: String?;
    
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
contract AllOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
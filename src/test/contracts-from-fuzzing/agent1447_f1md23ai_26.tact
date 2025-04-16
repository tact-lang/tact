contract InlineOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    
    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
    }
}
contract OptionalIntFields {
    a: Int?;
    b: Int?;
    c: Int?;
    
    init() {
        self.a = 10;
        self.b = null;
        self.c = 20;
    }
}
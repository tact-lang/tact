contract ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
    
    init() {
        self.a = 5;
        self.b = "hi";
        self.c = true;
        self.d = null;
    }
}
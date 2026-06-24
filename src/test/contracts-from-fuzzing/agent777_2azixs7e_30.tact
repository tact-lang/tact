contract RecInit {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    
    init() {
        self.a = 5;
        self.b = true;
        self.c = null;
        self.d = false;
    }
}
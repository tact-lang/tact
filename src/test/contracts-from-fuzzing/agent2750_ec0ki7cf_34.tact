contract WithFieldsAndInit {
    a: Int;
    b: Bool?;
    c: String = "hi";
    
    init() {
        self.a = 10;
        self.b = null;
        self.c = "changed";
    }
}

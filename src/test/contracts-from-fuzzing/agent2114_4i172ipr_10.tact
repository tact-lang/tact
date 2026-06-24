contract OnlyDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    s: String = "hello";
    
    init() {
        self.a = 10;
        self.b = false;
        self.c = 42;
        self.d = true;
        self.s = "world";
    }
}

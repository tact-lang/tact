contract JustDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    
    init() {
        self.a = 2;
        self.b = true;
        self.c = "hello";
    }
}
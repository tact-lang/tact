contract OnlyDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String? = null;
    
    init() {
        self.a = 42;
        self.b = true;
        self.c = "yes";
    }
}
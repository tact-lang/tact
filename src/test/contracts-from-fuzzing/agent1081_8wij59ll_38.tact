contract OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "text";
    
    init() {
        self.a = 10;
        self.b = true;
        self.c = "done";
    }
}
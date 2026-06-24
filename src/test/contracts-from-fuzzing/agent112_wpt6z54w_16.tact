contract PartialDefaults {
    a: Int = 11;
    b: Int;
    c: Int;
    
    init() {
        self.b = 22;
        self.c = 33;
    }
}
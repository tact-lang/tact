contract OptionalMixInit {
    a: Int?;
    b: Int?;
    
    init() {
        self.a = null;
        self.b = 42;
    }
}
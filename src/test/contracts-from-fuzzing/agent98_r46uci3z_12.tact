contract BoolAndOptional {
    a: Bool = false;
    b: Bool?;
    c: Bool?;
    
    init() {
        self.b = null;
        self.c = true;
    }
}
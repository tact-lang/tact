contract BoolOptionalMix {
    f1: Bool?;
    f2: Bool;
    
    init() {
        self.f1 = null;
        self.f2 = true;
    }
}
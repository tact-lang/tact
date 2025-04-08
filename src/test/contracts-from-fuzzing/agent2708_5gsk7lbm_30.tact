contract BoolOptPair {
    b: Bool;
    bo: Bool?;
    
    init() {
        self.b = true;
        self.bo = null;
    }
}
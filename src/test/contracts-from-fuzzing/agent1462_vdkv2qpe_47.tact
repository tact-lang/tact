struct OptionalOnly {
    x: Int? = null;
    y: Bool? = null;
}

contract OptionalOnlyField {
    s: OptionalOnly;
    
    init() {
        self.s = OptionalOnly{}; 
    }
}
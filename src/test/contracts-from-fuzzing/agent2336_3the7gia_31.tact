contract OptionalTop {
    v1: Int?;
    v2: Int? = null;
    v3: Int?;
    
    init() {
        self.v1 = null;
        self.v3 = 5;
    }
}
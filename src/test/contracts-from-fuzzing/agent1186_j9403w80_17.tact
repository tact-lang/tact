contract OptionalDefaultInitialization {
    x: Int?;
    y: Bool?;
    s: String?;
    
    init() {
        self.x = null;
        self.y = null;
        self.s = null;
    }
}

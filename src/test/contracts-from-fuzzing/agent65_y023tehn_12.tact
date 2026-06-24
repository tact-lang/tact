contract OptionalDefMissing {
    x: Int?;
    y: Bool;
    
    init() {
        self.x = null;
        self.y = false;
    }
}
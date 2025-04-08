contract InitDefaults {
    x: Int = 1;
    y: Int?;
    z: Bool = true;
    s: String = "hi";
    
    init() {
        self.y = null;
    }
}
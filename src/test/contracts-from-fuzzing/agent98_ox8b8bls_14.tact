contract OptionalFieldsDefaults {
    x: Int = 10;
    y: Int?;
    z: Bool?;
    s: String?;
    
    init() {
        self.y = null;
        self.z = null;
        self.s = null;
    }
}
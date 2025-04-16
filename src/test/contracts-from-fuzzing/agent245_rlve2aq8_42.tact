contract OptionalParamsDefaultNull {
    x: Int?;
    y: Bool?;
    z: Slice?;
    
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}
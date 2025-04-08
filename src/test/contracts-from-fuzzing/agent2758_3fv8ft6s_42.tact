contract DefaultOptional {
    x: Int? = null;
    y: Bool? = true;
    z: String? = "val";
    
    init() {
        self.x = null;
        self.y = false;
        self.z = "hello";
    }
}
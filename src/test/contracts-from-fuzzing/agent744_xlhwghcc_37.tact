contract ExplicitDefaultsAndOverride {
    x: Int = 7;
    y: Bool? = false;
    z: String? = null;
    
    init() {
        self.x = 123;
        self.y = null;
        self.z = "not null anymore";
    }
}
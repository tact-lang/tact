contract MixedDefaults {
    x: Int = 5;
    y: Int?;
    z: String = "str";
    a: String?;
    b: Bool = true;
    c: Bool?;
    
    init() {
        self.y = null;
        self.a = null;
        self.c = null;
    }
}

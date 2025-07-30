contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "x";
    
    init() {
        self.b = true;
    }
}
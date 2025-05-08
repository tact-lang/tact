contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: Int?; 
    d: Bool = true;

    init() {
        self.b = false;
        self.c = null;
    }
}
contract ZeroDefaults {
    a: Int = 0;
    b: Int as uint8 = 0;
    c: Bool = false;
    d: Int?; 
    e: Bool?; 
    init() {
        self.d = null;
        self.e = null;
    }
}
contract Defaulted {
    x: Int = 1;
    y: Int = 2;
    z: Int?;
    
    init() {
        self.x = 42;
        self.y = 99;
        self.z = null;
    }
}

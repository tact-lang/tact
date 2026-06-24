contract SerializeCombo {
    x: Int as coins;
    y: Int as uint64;
    z: Int;
    t: Int as int8;
    
    init() {
        self.x = ton("5");
        self.y = 1234;
        self.z = -55;
        self.t = -8;
    }
}
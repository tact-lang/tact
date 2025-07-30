contract TypesInt {
    x: Int as int64;
    y: Int as uint32;
    z: Int as coins;

    init() {
        self.x = 42;
        self.y = 10;
        self.z = ton("1.5");
    }
}
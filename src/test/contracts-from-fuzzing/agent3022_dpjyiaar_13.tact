contract SerialOrder {
    x: Int as uint32;
    y: Int as int64;
    z: Int;

    init() {
        self.x = 42;
        self.y = -123;
        self.z = 999;
    }
}

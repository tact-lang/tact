contract UnitFieldSizes {
    x: Int as uint1;
    y: Int as uint8;
    z: Int as int257;

    init() {
        self.x = 1;
        self.y = 255;
        self.z = 123456789;
    }
}
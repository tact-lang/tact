contract TestContract {
    x: Int as int8 = 0;
    y: Int as uint32 = 0;
    z: Int as int64 = 0;
    w: Int as uint1 = 0;

    init() {
        self.x = -5;
        self.y = 123456;
        self.z = -9876543210;
        self.w = 1;
    }
}
contract TestContract {
    x: Int as uint8;
    y: Int as uint32;
    z: Int as int64;

    init() {
        self.x = 5;
        self.y = 1000;
        self.z = -1000000;
    }
}
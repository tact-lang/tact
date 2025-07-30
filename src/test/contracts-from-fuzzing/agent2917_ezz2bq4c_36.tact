contract DifferentSerializations {
    x: Int as int8;
    y: Int as uint16;
    z: Int as int257;

    init() {
        self.x = 7;
        self.y = 60000;
        self.z = -123;
    }
}

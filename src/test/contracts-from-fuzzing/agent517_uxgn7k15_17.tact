contract DifferentSerializations {
    x: Int as uint4;
    y: Int as int8;
    z: Int as uint32;

    init() {
        self.x = 15;
        self.y = -128;
        self.z = 4294967295;
    }
}
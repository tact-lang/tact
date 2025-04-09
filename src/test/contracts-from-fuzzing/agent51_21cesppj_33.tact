contract WeirdSerializations {
    x: Int as uint4;
    y: Int as int8;
    z: Int as uint16;

    init() {
        self.x = 7;
        self.y = -5;
        self.z = 65535;
    }
}
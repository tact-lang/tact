contract ManySerializations {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;
    w: Int;

    init() {
        self.x = 10;
        self.y = -20;
        self.z = 30;
        self.w = 40;
    }
}
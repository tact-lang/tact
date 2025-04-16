contract IntSerializations {
    x: Int as int8;
    y: Int as int16;
    z: Int as int32;

    init() {
        self.x = -100;
        self.y = -1000;
        self.z = -10000;
    }
}
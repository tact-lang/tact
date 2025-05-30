contract IntSerialization {
    x: Int as int32;
    y: Int as uint8;
    z: Int as int257;

    init() {
        self.x = -1000;
        self.y = 255;
        self.z = 123456789;
    }
}
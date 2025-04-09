contract Test {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint32;

    init() {
        self.x = 0;
        self.y = 0;
        self.z = 0;
    }

    receive() {
        self.x = 255;
        self.y = 9223372036854775807; // max int64
        self.z = 4294967295; // max uint32
    }
}

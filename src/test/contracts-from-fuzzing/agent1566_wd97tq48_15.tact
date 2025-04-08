contract SerializedInts {
    x: Int as uint64;
    y: Int as int8;
    z: Int as uint16;

    init() {
        self.x = 12345;
        self.y = -12;
        self.z = 65000;
    }
}

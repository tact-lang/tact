contract ManualSerialization {
    x: Int as uint32;
    y: Int as int16;
    z: Int as coins;

    init() {
        self.x = 100;
        self.y = -50;
        self.z = 1_000_000;
    }
}
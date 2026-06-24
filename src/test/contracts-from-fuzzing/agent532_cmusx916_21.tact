contract SerialDefaults {
    x: Int as uint32 = 0;
    y: Int as int8 = -5;
    z: Int as coins;

    init() {
        self.z = 1000000;
    }
}
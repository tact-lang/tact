contract DefaultsAndSerialization {
    x: Int as uint128 = 1;
    y: Int as int8 = -5;
    z: Int = 42;

    init() {
        self.x = 99999;
        self.y = -8;
        self.z = 100;
    }
}
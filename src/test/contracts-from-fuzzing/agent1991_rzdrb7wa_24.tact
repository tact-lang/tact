contract FieldReorderingSerialization {
    x: Int as uint32;
    y: Int;
    z: Int as uint8;

    init() {
        self.x = 1;
        self.y = 2;
        self.z = 3;
    }
}
contract TypeAlias {
    x: Int as int32;
    y: Int as uint16;

    init() {
        self.x = 12345;
        self.y = 65535;
    }
}
contract EdgeIntAssign {
    a: Int as int8;
    b: Int as uint8;

    init() {
        self.a = -128;
        self.b = 255;
    }
}
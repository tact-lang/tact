contract AllIntBoundaries {
    int8min: Int as int8;
    int8max: Int as int8;
    uint8max: Int as uint8;

    init() {
        self.int8min = -128;
        self.int8max = 127;
        self.uint8max = 255;
    }
}
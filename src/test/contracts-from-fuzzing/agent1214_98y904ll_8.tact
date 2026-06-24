contract Test8 {
    x: Int = -10;
    y: Int as uint8 = 256; // deliberately out-of-bounds default
    init() {
        self.x = 0;
        self.y = 255;
    }
}
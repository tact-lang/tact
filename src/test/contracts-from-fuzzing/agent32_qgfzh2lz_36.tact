contract OutOfRangeFail {
    x: Int as uint8;

    init() {
        self.x = 300;  // out of allowed range for uint8
    }
}

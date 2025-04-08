contract RuntimeOverflowCheck {
    i: Int as uint8;

    init() {
        self.i = -1;
        self.i = 500;
    }
}
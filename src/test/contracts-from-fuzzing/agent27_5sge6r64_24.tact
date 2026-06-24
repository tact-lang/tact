contract TestContract {
    x: Int as uint8 = 42;
    init() {
        self.x = 256; // overflow for uint8
    }
}

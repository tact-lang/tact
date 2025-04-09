contract TestContract {
    x: Int as uint8;

    init() {
        self.x = 255; // max okay for uint8
    }
}
contract TestContract {
    smallUint: Int as uint8;

    init() {
        self.smallUint = 256; // Out of range value to test init assignment
    }
    receive() { let s = self.smallUint; }
}
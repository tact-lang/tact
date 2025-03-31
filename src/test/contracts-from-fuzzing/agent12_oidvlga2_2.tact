contract Test2 {
    oneByte: Int as uint8;

    init() {
        self.oneByte = 300; // expected error: value out-of-range for uint8 type
    }

    // Deployment receiver
    receive() {}
}

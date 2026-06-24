contract TestCastingValid {
    // Using cast (type modifier) in contract field declaration is valid as per documentation
    val: Int as uint8; // Int, serialized to a 32-bit unsigned, here uint8

    init() {
        // 200 fits in uint8 (0-255)
        self.val = 200;
    }

    receive() {
        dump(self.val); // Expected output: 200
    }
}

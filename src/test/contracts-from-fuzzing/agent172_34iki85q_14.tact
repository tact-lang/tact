contract DefaultsAndInit {
    x: Int as int64 = 123;
    y: Int as uint8 = 255;
    z: Bool = true;
    message: String = "Hello";

    init() {
        // Assign different values overriding defaults
        self.x = -456;
        self.y = 128;
        self.z = false;
        self.message = "World";
    }
}
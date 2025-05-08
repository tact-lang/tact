contract SerializationOverlapping {
    x: Int as uint8;
    y: Int as uint8;

    init() {
        self.x = 42;
        self.y = 99;
    }
}
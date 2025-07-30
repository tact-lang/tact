contract InitAssignWrongOrder {
    x: Int as uint8;
    y: Int as uint8;

    init() {
        self.x = 300; // out of 0..255
        self.x = 10;  // within range
        self.y = -10; // out of 0..255
        self.y = 20;  // within range
    }
}
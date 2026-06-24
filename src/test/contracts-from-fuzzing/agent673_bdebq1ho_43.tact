contract NegativeOutOfRangePersistence {
    y: Int as uint8;

    init() {
        self.y = -5; // negative for unsigned
    }
}
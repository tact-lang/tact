contract OutOfRangePersistence {
    x: Int as uint8;

    init() {
        self.x = 300; // beyond uint8
    }
}
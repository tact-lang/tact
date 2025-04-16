contract IntOutOfRangePersistence {
    a: Int as uint8;
    init() {
        self.a = -5; // assign negative to unsigned
    }
}

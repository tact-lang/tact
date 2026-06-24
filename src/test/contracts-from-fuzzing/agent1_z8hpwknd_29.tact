contract OutOfRangeAfterInit {
    small: Int as uint8;

    init() {
        self.small = 1000; // deliberately exceeding uint8
    }
}
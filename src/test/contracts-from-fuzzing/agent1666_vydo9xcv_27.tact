contract BoundaryTest {
    small: Int as uint8;
    init() {
        self.small = -1;
        self.small = 500;
    }
}
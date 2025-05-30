contract RangeTest {
    num8: Int as uint8;

    init() {
        self.num8 = 300; // exceeds 255
    }

    receive() {}
}

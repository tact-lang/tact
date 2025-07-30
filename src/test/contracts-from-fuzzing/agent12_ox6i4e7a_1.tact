contract SingleLargeInt {
    large: Int;

    init() {
        self.large = 123456789012345678901234567890;
    }

    receive() {
        self.large = 42;
    }
}

contract OnlyLargeInt {
    x: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    init() {
        self.x = 1;
    }
}
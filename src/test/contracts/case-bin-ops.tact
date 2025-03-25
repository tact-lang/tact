contract SampleContract {
    a: Int;

    init() {
        self.a = (1 + 2 - 3) / 4 % 5 | 255 & 53 ^ 2;
        if (1 > 2 || 3 == 0 && (5 - 3) * 10 > 0) {}
    }
}

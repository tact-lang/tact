contract SampleContract {
    a: Int;

    init() {
        self.a = 0;
        self.a += 2;
        self.a -= 1;
        self.a *= 2;
        self.a /= 2;
        self.a %= 5;
    }
}
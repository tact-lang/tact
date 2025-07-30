contract DefaultsVsInit {
    n: Int = 10;
    m: Int;

    init() {
        self.n = 1;
        self.m = 2;
    }
}

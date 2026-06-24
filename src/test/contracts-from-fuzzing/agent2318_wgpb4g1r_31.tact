contract DefaultVsInit {
    a: Int = 1;
    b: Int = 2;
    c: Int;

    init() {
        self.b = 20;
        self.c = 30;
    }
}

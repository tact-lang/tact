contract DefaultsPartialInit {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;

    init() {
        self.b = 20;
        self.c = 30;
    }
}

contract DefaultsAndInit {
    a: Int = 1;
    b: Int = 2;
    c: Int;
    init() {
        self.c = 3;
        self.b = 4;
    }
}
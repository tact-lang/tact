contract DefaultAndInit {
    a: Int = 5;
    b: Int;
    c: Int?;

    init() {
        self.b = 10;
        self.c = null;
    }
}

contract MixedInit {
    a: Int;
    b: Int = 2;
    c: Int;
    d: Int = 4;
    e: Int;

    init() {
        self.a = 1;
        self.c = 3;
        self.e = 5;
    }
}
contract DataMix {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: Int = 42;

    init() {
        self.c = 5;
        self.d = false;
        self.e = 100;
    }
}
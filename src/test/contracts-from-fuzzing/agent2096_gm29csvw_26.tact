contract UninitMix {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
    init() {
        self.a = 10;
        self.d = true;
    }
}
contract OptionMix {
    a: Int?;
    b: Bool;
    c: Int? as uint32;
    d: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 7;
        self.d = null;
    }
}
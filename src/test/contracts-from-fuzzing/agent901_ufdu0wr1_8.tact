contract TestContract {
    s1: Int as uint8;
    s2: Int as int4;
    s3: Bool;
    s4: Bool?;

    init() {
        self.s1 = 1;
        self.s2 = -2;
        self.s3 = true;
        self.s4 = null;
    }
}
contract SerializationTest {
    s1: Int as uint32;
    s2: Int as int64;
    s3: Int as coins;
    s4: Bool;
    s5: String;

    init() {
        self.s1 = 1;
        self.s2 = 2;
        self.s3 = 3;
        self.s4 = false;
        self.s5 = "t";
    }
}
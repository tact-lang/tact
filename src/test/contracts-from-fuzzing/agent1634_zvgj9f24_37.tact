contract SerializeKinds {
    s1: Int as int64;
    s2: Int as uint32;
    s3: Int;

    init() {
        self.s1 = -123456;
        self.s2 = 77777;
        self.s3 = 42;
    }
}
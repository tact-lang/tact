contract SerializeIntVariants {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int257;
    d: Int as uint256;

    init() {
        self.a = 1;
        self.b = 1;
        self.c = 123456;
        self.d = 654321;
    }
}
contract ExplicitSerialization {
    val1: Int as int16;
    val2: Int as uint240;
    val3: Int as int257;

    init() {
        self.val1 = 5;
        self.val2 = 123456789;
        self.val3 = -42;
    }
}
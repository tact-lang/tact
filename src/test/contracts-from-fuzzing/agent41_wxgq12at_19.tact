contract PrimitiveWithSerialization {
    smallUint: Int as uint4;
    largeInt: Int as int257;
    tinyInt: Int as int1;

    init() {
        self.smallUint = 7;
        self.largeInt = 0;
        self.tinyInt = -1;
    }
}

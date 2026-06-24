contract SerializedPrimitives {
    tinyInt: Int as uint8;
    negInt: Int as int16;
    manyBits: Int as uint120;

    init() {
        self.tinyInt = 255;
        self.negInt = -32768;
        self.manyBits = pow(2, 119);
    }
}

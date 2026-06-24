contract TestContract {
    intField: Int = -1;
    uint8Field: Int as uint8 = 255;
    int64Field: Int as int64 = -1000;
    uint32Field: Int as uint32 = 65535;
    optBool: Bool? = null;

    init() {
        self.intField = 100;
        self.uint8Field = 200;
        self.int64Field = 123456789;
        self.uint32Field = 4000000;
        self.optBool = true;
    }
}
contract OptionalFieldsWithDefaults {
    intOpt: Int? = null;
    strOpt: String? = null;
    boolOpt: Bool? = null;
    plainInt: Int = 77;
    plainStr: String = "hi";
    plainBool: Bool = true;

    init() {
        self.intOpt = 42;
        self.strOpt = "test";
        self.boolOpt = false;
        self.plainInt = 100;
        self.plainStr = "changed";
        self.plainBool = false;
    }
}
contract SerializationTest {
    smallInt: Int as int8;
    bigInt: Int as int256;
    defaultInt: Int;
    optSmall: Int? as int8;
    optBig: Int? as int256;

    init() {
        self.smallInt = 7;
        self.bigInt = 123456789;
        self.defaultInt = -5;
        self.optSmall = null;
        self.optBig = 99;
    }
}
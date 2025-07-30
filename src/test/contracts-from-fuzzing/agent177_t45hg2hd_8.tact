contract ManyFieldsTypes {
    intField: Int = -5;
    boolField: Bool = false;
    stringField: String = "x";
    addressField: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    stringOpt: String? = null;
    addrOpt: Address? = null;

    init() {
        self.intField = 100;
        self.boolField = true;
        self.stringField = "hello";
        self.addressField = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.intOpt = null;
        self.boolOpt = false;
        self.stringOpt = null;
        self.addrOpt = null;
    }
    receive(){}
}
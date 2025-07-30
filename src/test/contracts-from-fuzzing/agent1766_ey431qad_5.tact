contract OptionalPrimitiveFields {
    number: Int?;
    flag: Bool?;
    addressVal: Address?;
    stringVal: String?;

    init() {
        self.number = 1;
        self.flag = false;
        self.addressVal = null;
        self.stringVal = "hello";
    }
}

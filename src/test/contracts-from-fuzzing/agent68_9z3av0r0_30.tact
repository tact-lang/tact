contract OptionalAndNormal {
    oInt: Int?;
    intValue: Int;
    oBool: Bool?;
    boolValue: Bool;

    init() {
        self.oInt = null;
        self.intValue = 42;
        self.oBool = null;
        self.boolValue = true;
    }
}
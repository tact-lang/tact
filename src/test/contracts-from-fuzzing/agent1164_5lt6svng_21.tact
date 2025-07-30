contract MixedOptional {
    optInt: Int?;
    optBool: Bool?;
    reqInt: Int;
    reqBool: Bool;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.reqInt = 12;
        self.reqBool = false;
    }
}
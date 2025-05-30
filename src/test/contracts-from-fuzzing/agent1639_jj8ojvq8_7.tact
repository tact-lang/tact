contract MixedPrimitives {
    intF: Int;
    boolF: Bool;
    stringF: String;
    optIntF: Int?;
    optBoolF: Bool?;
    optStringF: String?;

    init() {
        self.intF = 7;
        self.boolF = true;
        self.stringF = "s";
        self.optIntF = null;
        self.optBoolF = false;
        self.optStringF = null;
    }
}

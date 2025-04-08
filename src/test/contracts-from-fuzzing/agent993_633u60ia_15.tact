contract OptionalAndDefault {
    optionalField: Bool?;
    intField: Int = 5;
    boolField: Bool = true;
    strField: String = "default";

    init() {
        self.optionalField = null;
        self.intField = 10;
        self.boolField = false;
        self.strField = "changed";
    }
}
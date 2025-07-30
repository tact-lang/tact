contract OptionalOnPrimitives {
    valInt: Int?;
    valBool: Bool?;
    valString: String?;

    init() {
        self.valInt = 42;
        self.valBool = null;
        self.valString = "opt";
    }
}
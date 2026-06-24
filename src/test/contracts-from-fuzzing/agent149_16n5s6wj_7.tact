contract MixedPrimitives {
    valInt: Int;
    valBool: Bool;
    valString: String;
    valOptInt: Int?;
    valOptString: String?;

    init() {
        self.valInt = 42;
        self.valBool = true;
        self.valString = "hello";
        self.valOptInt = null;
        self.valOptString = "world";
    }
}
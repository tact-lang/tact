contract MixTypes {
    someInt: Int;
    someBool: Bool;
    someString: String;
    someOptionalInt: Int?;
    someOptionalBool: Bool?;
    someOptionalString: String?;

    init() {
        self.someInt = 12;
        self.someBool = true;
        self.someString = "str";
        self.someOptionalInt = null;
        self.someOptionalBool = null;
        self.someOptionalString = null;
    }
}
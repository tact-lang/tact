contract MixedTypes {
    integer: Int as int64;
    boolean: Bool;
    text: String;
    optionalInt: Int?;
    optionalBool: Bool?;

    init() {
        self.integer = 42;
        self.boolean = true;
        self.text = "test";
        self.optionalInt = null;
        self.optionalBool = false;
    }
}
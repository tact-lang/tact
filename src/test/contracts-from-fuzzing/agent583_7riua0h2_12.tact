struct Nested {
    aa: Int;
    bb: Bool;
    cc: String;
}

contract OptionalFieldsContract {
    optNested: Nested?;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optNested = null;
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}
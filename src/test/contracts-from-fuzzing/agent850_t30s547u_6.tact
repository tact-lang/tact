struct Nested {
    val: Int;
}

contract OptNullable {
    optStruct: Nested?;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optStruct = null;
        self.optInt = null;
        self.optBool = null;
    }
}
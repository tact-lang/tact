struct Inner {
    content: String;
}

contract Test {
    optStruct: Inner?;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optStruct = null;
        self.optInt = null;
        self.optBool = null;
    }
}

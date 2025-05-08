struct S {
    x: Int;
}

contract OptionalPrimitive {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optStruct: S?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optStruct = null;
    }

    receive() {
        self.optInt = 1;
        self.optBool = true;
        self.optStr = "x";
        self.optStruct = S{ x: 5 };
    }
}
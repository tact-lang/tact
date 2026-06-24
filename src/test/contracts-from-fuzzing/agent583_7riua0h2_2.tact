struct Inner {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalStructContract {
    myStruct: Inner;

    init() {
        self.myStruct = Inner{
            intField: 7,
            boolField: false,
            strField: "hello",
            optInt: null,
            optBool: null,
            optStr: null,
        };
    }
}
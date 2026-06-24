struct OptionalStruct {
    intField: Int;
    boolField: Bool;
    stringField: String;
}

contract OptionalStorage {
    optField1: OptionalStruct?;
    optField2: Bool?;
    optField3: String?;
    optField4: Int?;

    init() {
        self.optField1 = OptionalStruct{
            intField: 1,
            boolField: true,
            stringField: "hi",
        };
        self.optField2 = false;
        self.optField3 = "hello";
        self.optField4 = 42;
    }
}
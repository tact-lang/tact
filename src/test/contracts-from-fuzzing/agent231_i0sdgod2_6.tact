struct SomeStruct {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract ComboTypes {
    data: SomeStruct;

    init() {
        self.data = SomeStruct{
            intField: 7,
            boolField: true,
            stringField: "test",
            optInt: null,
            optBool: false,
            optString: null,
        };
    }
}
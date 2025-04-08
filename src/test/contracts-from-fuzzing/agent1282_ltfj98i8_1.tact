struct ExampleStruct {
    num: Int;
    text: String;
    flag: Bool;
    optionalNum: Int?;
    optionalText: String?;
    optionalFlag: Bool?;
}

contract TestPersistent {
    field: ExampleStruct;

    init() {
        self.field = ExampleStruct{
            num: 42,
            text: "test",
            flag: true,
            optionalNum: null,
            optionalText: null,
            optionalFlag: null
        };
    }
}
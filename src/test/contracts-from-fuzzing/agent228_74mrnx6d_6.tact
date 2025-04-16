struct RichStruct {
    intVal: Int = -1;
    boolVal: Bool = false;
    stringVal: String = "string";
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalsMix {
    data: RichStruct;

    init() {
        self.data = RichStruct{
            intVal: 123,
            boolVal: true,
            stringVal: "abc",
            intOpt: null,
            boolOpt: null,
            stringOpt: "xyz"
        };
    }
}
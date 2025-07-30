struct ManyFieldsStruct {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Bool?;
    f05: String?;
    f06: Int?;
    f07: Int;
    f08: Bool;
    f09: String;
    f10: Int?;
    f11: String?;
    f12: Bool?;
}

contract ManyFieldsContract {
    data: ManyFieldsStruct;
    
    init() {
        self.data = ManyFieldsStruct{
            f01: 1,
            f02: true,
            f03: "abc",
            f04: null,
            f05: null,
            f06: null,
            f07: 7,
            f08: false,
            f09: "def",
            f10: null,
            f11: null,
            f12: null
        };
    }
}

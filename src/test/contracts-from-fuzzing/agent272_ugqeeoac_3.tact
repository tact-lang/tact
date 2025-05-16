struct ManyFieldsStruct {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int?;
    a5: Bool?;
    a6: String;
    a7: Int;
    a8: String;
    a9: Bool;
    a10: Int?;
}

contract FieldStructPersist {
    sfield: ManyFieldsStruct;

    init() {
        self.sfield = ManyFieldsStruct{
            a1: 1,
            a2: true,
            a3: "abc",
            a4: null,
            a5: false,
            a6: "def",
            a7: 7,
            a8: "ghi",
            a9: true,
            a10: 10,
        };
    }
}
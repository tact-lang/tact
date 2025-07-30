struct LongStruct {
    a1: Int;
    a2: Bool;
    a3: String?;
    a4: Int;
    a5: Bool?;
    a6: String;
    a7: Int?;
    a8: Bool;
    a9: String?;
    a10: Int;
    a11: Bool;
    a12: String?;
}

contract ManyFields {
    state: LongStruct;

    init() {
        self.state = LongStruct{
            a1: 1,
            a2: true,
            a3: null,
            a4: 4,
            a5: null,
            a6: "hi",
            a7: null,
            a8: false,
            a9: null,
            a10: 10,
            a11: true,
            a12: null
        };
    }
}
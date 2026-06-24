struct LargeStruct {
    a1: Int;
    a2: Bool;
    a3: Int?;
    a4: Bool?;
    a5: Int;
    a6: Bool;
    a7: Int?;
    a8: Bool?;
    a9: Int;
    a10: Bool;
}

contract ManyFields {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a1: 1, a2: true, a3: null, a4: false,
            a5: 5, a6: true, a7: 7, a8: null,
            a9: 9, a10: false
        };
    }
}

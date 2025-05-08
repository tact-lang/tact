struct BigStruct {
    x1: Int;
    x2: Int;
    x3: Bool;
    x4: Bool;
    x5: Int?;
    x6: Bool?;
    x7: Int;
    x8: Bool;
    x9: Int;
    x10: Bool?;
}

contract ManyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            x1: 1, x2: 2, x3: true, x4: false, x5: null,
            x6: true, x7: 7, x8: false, x9: 9, x10: null
        };
    }
}
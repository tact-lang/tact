struct BigStruct {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Int?;
    x5: Bool?;
    x6: String?;
}

contract ManyStructs {
    data: BigStruct = BigStruct{
        x1: 1,
        x2: false,
        x3: "a",
        x4: null,
        x5: true,
        x6: null,
    };

    init() {
        self.data = BigStruct{
            x1: 2,
            x2: true,
            x3: "b",
            x4: 3,
            x5: false,
            x6: "c",
        };
    }
}
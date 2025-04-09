struct BigStruct {
    a1: Int;
    a2: Bool = true;
    a3: Bool;
    a4: Int = 42;
    a5: String;
    a6: Int?;
    a7: Bool?;
    a8: String = "hi";
    a9: Int = -1;
    a10: Bool;
    a11: String?;
    a12: Int;
    a13: Bool = false;
    a14: String = "done";
    a15: Int?;
}

contract ManyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a1: 1,
            a3: false,
            a5: "test",
            a6: null,
            a7: true,
            a10: true,
            a11: null,
            a12: 77,
            a15: 500,
        };
    }
}
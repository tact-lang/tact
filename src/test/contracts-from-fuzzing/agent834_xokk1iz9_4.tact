struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Int;
    f10: Bool;
}

contract ManyFields {
    big: BigStruct = BigStruct{
        f1: 1,
        f2: true,
        f3: 3,
        f4: false,
        f5: "a",
        f6: 6,
        f7: true,
        f8: "b",
        f9: 9,
        f10: false
    };
}

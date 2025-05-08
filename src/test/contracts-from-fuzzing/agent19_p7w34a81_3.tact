struct LargeStruct {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int;
    a5: Bool;
    a6: String;
    a7: Int;
    a8: Bool;
    a9: String;
    a10: Int;
    a11: Bool;
    a12: String;
}

contract LargeFieldsContract {
    large: LargeStruct;

    init() {
        self.large = LargeStruct{
            a1: 1,
            a2: true,
            a3: "a",
            a4: 2,
            a5: false,
            a6: "b",
            a7: 3,
            a8: true,
            a9: "c",
            a10: 4,
            a11: false,
            a12: "d",
        };
    }
}
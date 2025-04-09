struct VeryLongStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: String;
    f9: String;
    f10: String;
    f11: Int?;
    f12: Bool?;
    f13: String?;
}

contract UsesVeryLongStruct {
    s: VeryLongStruct = VeryLongStruct{
        f1: 1,
        f2: 2,
        f3: 3,
        f4: 4,
        f5: 5,
        f6: true,
        f7: false,
        f8: "a",
        f9: "b",
        f10: "c",
        f11: null,
        f12: null,
        f13: null,
    };

    receive() {}
}
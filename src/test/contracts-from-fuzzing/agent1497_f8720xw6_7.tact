struct Wide {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract TestContract {
    wide: Wide = Wide{
        f1: 1,
        f2: false,
        f3: "a",
        f4: null,
        f5: true,
        f6: "b",
        f7: 7,
        f8: false,
        f9: "c",
        f10: null
    };
}
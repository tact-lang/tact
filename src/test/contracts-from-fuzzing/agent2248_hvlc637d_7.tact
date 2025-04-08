struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Int?;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract WithLongStruct {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: true,
            f3: "3",
            f4: 4,
            f5: false,
            f6: "6",
            f7: null,
            f8: true,
            f9: "9",
            f10: 10
        };
    }
}
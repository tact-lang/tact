struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: Int?;
    f9: Bool?;
    f10: Int;
}

contract BigStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5,
            f6: true, f7: false, f8: null, f9: null, f10: 10
        };
    }
}
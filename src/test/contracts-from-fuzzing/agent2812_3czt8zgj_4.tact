struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool;
    f9: Int;
    f10: Bool;
}

contract TestLarge {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1, f2: true, f3: null, f4: false, f5: 5,
            f6: true, f7: null, f8: false, f9: 9, f10: true
        };
    }
}
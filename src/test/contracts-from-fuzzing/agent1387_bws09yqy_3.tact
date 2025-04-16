struct LargeStruct {
    f1: Int; f2: Int; f3: Bool; f4: Bool;
    f5: Int; f6: Bool; f7: Int; f8: Bool;
    f9: Int; f10: Int;
}

contract LargeFields {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            f1: 1, f2: 2, f3: true, f4: false,
            f5: 5, f6: true, f7: 7, f8: false,
            f9: 9, f10: 10,
        };
    }
}
struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 1, f2: true, f3: null, f4: false,
            f5: 5, f6: true, f7: 7, f8: null,
            f9: 9, f10: false, f11: 11, f12: null
        };
    }
}
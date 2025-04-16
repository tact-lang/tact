struct FlatTen {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: Bool;
}

contract FlatLargeStruct {
    test_field: FlatTen;
    init() {
        self.test_field = FlatTen{
            f1: 1,
            f2: false,
            f3: 3,
            f4: true,
            f5: 5,
            f6: false,
            f7: 7,
            f8: true,
            f9: 9,
            f10: false,
        };
    }
}
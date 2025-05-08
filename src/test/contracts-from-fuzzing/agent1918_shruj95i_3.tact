struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Int;
    f5: Bool;
    f6: Int;
    f7: Bool;
    f8: Int;
    f9: Bool;
    f10: Int;
}

contract TestContract {
    bigData: BigStruct;

    init() {
        self.bigData = BigStruct{
            f1: 1,
            f2: 2,
            f3: true,
            f4: 4,
            f5: false,
            f6: 6,
            f7: true,
            f8: 8,
            f9: false,
            f10: 10
        };
    }
}
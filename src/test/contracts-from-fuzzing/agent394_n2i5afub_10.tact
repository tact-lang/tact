struct BigStruct {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Int = 6;
    f7: Int = 7;
    f8: Int = 8;
    f9: Int = 9;
    f10: Int = 10;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 11, f2: 12, f3: 13, f4: 14, f5: 15,
            f6: 16, f7: 17, f8: 18, f9: 19, f10: 20
        };
    }
}
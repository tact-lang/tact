struct BigStruct {
    x0: Int;
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Int;
    x12: Int;
    x13: Int;
    x14: Int;
    x15: Int;
}

contract BigStorage {
    huge: BigStruct;

    init() {
        self.huge = BigStruct{
            x0:0,x1:0,x2:0,x3:0,x4:0,x5:0,x6:0,x7:0,x8:0,x9:0,x10:0,x11:0,x12:0,x13:0,x14:0,x15:0
        };
    }
}
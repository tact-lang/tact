struct Inner {
    x: Int;
    y: Int;
    flag: Bool;
    message: String;
    optInt: Int?;
}

contract StorageVariants {
    s1: Int;
    s2: Bool;
    s3: Address;
    s4: String;
    s5: Int?;
    s6: Slice;
    s7: Cell;
    s8: Builder;
    s9: Inner;
    init() {
        self.s1 = 12;
        self.s2 = false;
        self.s3 = myAddress();
        self.s4 = "string";
        self.s5 = null;
        self.s6 = emptyCell().asSlice();
        self.s7 = emptyCell();
        self.s8 = beginCell();
        self.s9 = Inner{
            x: 1, y: 2, flag: true, message: "hi", optInt: null
        };
    }
}
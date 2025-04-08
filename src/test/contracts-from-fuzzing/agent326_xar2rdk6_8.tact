struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int;
    f5: Bool;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: Address;
}

contract LargeField {
    big: BigStruct;
    
    init() {
        self.big = BigStruct{
            f1:1, f2:true, f3:myAddress(),
            f4:2, f5:false, f6:myAddress(),
            f7:3, f8:true, f9:myAddress(),
            f10:4,f11:false,f12:myAddress(),
        };
    }

    receive() {
        self.big = self.big;
    }
}
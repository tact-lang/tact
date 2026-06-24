struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: Address;
    f7: String;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Int;
    f12: Bool;
    f13: Address;
    f14: String;
    f15: Int;
    f16: Bool;
    f17: String;
    f18: Int;
    f19: Bool;
    f20: Address;
}

contract BigFields {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            f1:1, f2:2, f3:3, f4:true, f5:"a", f6:myAddress(),
            f7:"b", f8:false, f9:"c", f10:10, f11:11, f12:true,
            f13:myAddress(), f14:"d", f15:15, f16:false, f17:"e",
            f18:18, f19:true, f20:myAddress()
        };
    }
}
struct LargeFlatStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Int;
    f6: Bool;
    f7: Address;
    f8: String;
    f9: Int;
    f10: Bool;
    f11: Address;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: String;
}

contract TestContract {
    data: LargeFlatStruct;

    init() {
        self.data = LargeFlatStruct{
            f1:1, f2:true, f3:myAddress(), f4:"a",
            f5:2, f6:false, f7:myAddress(), f8:"b",
            f9:3, f10:true, f11:myAddress(), f12:"c",
            f13:4, f14:false, f15:myAddress(), f16:"d",
        };
    }
}
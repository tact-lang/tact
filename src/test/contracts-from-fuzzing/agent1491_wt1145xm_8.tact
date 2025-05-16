struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Address;
    f13: Int;
    f14: Bool;
    f15: String;
}

contract LongStructField {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1, f2:true, f3:"3", f4:myAddress(), f5:5,
            f6:false, f7:"7", f8:myAddress(), f9:9, f10:true,
            f11:"11", f12:myAddress(), f13:13, f14:false, f15:"15"
        };
    }
}
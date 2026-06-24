struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: String?;
    f12: Bool?;
}

contract LongListContract {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1, f2:true, f3:"a", f4:null, f5:null, f6:false,
            f7:2, f8:false, f9:"b", f10:3, f11:"c", f12:null
        };
    }
}
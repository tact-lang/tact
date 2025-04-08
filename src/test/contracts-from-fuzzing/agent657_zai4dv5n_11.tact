struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: Bool?;
    f12: String?;
}

contract TestContract {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1,f2:true,f3:"a",f4:null,f5:false,f6:null,f7:2,f8:true,f9:"b",f10:3,f11:null,f12:"c"
        };
    }
}
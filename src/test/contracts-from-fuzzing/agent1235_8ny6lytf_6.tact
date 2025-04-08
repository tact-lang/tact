struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: String;
}

contract ManyFields {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1, f2:true, f3:"a",
            f4:2, f5:false, f6:"b",
            f7:3, f8:true, f9:"c",
            f10:4, f11:false, f12:"d"
        };
    }
}
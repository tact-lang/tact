struct LongList {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: String; f17: String; f18: String; f19: String; f20: String;
}

contract BigOne {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:true,f12:false,f13:true,f14:false,f15:true,
            f16:"a",f17:"b",f18:"c",f19:"d",f20:"e"
        };
    }
}

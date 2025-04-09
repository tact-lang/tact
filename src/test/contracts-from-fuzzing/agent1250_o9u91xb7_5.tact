struct LongStruct {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    s1: String; s2: String; s3: String?; s4: String?;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:true,f12:false,f13:true,f14:false,f15:true,
            s1:"a", s2:"b", s3:null, s4:"zz"
        };
    }
}
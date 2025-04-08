struct LargeStruct {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Bool; f7: Bool; f8: Bool; f9: Bool; f10: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    o1: Int?; o2: Bool?; o3: String?;
}

contract LargeStorage {
    ls: LargeStruct;
    init() {
        self.ls = LargeStruct{
            f1:0,f2:0,f3:0,f4:0,f5:0,
            f6:false,f7:false,f8:false,f9:false,f10:false,
            s1:"",s2:"",s3:"",s4:"",s5:"",
            o1:null, o2:null, o3:null
        };
    }
}
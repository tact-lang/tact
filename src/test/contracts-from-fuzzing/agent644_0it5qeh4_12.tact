struct BigFields {
    f1: Int; f2: Bool; f3: String; f4: Int?; f5: Bool?;
    f6: String; f7: Int; f8: Bool; f9: String; f10: Int?;
    f11: Bool?; f12: String; f13: Int; f14: Bool; f15: String;
}

contract Test {
    data: BigFields;

    init() {
        self.data = BigFields{
            f1:1,f2:true,f3:"a",f4:null,f5:false,
            f6:"b",f7:7,f8:true,f9:"c",f10:10,
            f11:true,f12:"d",f13:13,f14:false,f15:"e"
        };
    }
}
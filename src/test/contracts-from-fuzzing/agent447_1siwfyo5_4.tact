struct ManyFields {
    a1: Int; a2: Bool; a3: String; a4: Int?; a5: String?; a6: Bool?; a7: Int; a8: Bool; a9: String; a10: Int?;
    a11: String?; a12: Bool?; a13: Int; a14: Bool; a15: String; a16: Int?; a17: String?; a18: Bool?; a19: Int; a20: Bool;
}

contract LongFields {
    big: ManyFields;
    
    init() {
        self.big = ManyFields {
            a1:1,a2:true,a3:"",a4:null,a5:null,a6:null,a7:2,a8:false,a9:"x",a10:null,
            a11:null,a12:null,a13:3,a14:true,a15:"y",a16:null,a17:null,a18:null,a19:4,a20:false
        };
    }
}
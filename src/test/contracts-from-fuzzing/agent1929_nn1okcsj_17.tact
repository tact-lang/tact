struct LargeStruct {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    s0: String; s1: String; s2: String; s3: String; s4: String;
    o0: Int?; o1: String?; o2: Bool?; o3: Int?; o4: String?;
}

contract LargeStructContract {
    big: LargeStruct;
    init() {
        self.big = LargeStruct{
            a0:0,a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,
            b0:true,b1:false,b2:true,b3:false,b4:true,
            s0:"a",s1:"b",s2:"c",s3:"d",s4:"e",
            o0:null,o1:"x",o2:true,o3:123,o4:null
        };
    }
}
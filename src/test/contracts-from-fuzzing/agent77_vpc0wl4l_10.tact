struct SBig {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int;
    x6: Int; x7: Int; x8: Int; x9: Int; x10: Int;
    y1: Bool; y2: Bool; y3: Bool; y4: Bool; y5: Bool;
    y6: Bool; y7: Bool; y8: Bool; y9: Bool; y10: Bool;
    z1: String; z2: String; z3: String; z4: String; z5: String;
}

contract BigStructStorage {
    val: SBig;

    init() {
        self.val = SBig{
            x1:1,x2:2,x3:3,x4:4,x5:5,
            x6:6,x7:7,x8:8,x9:9,x10:10,
            y1:true,y2:false,y3:true,y4:false,y5:true,
            y6:false,y7:true,y8:false,y9:true,y10:false,
            z1:"a",z2:"b",z3:"c",z4:"d",z5:"e"
        };
    }

    receive() {
        self.val = SBig{
            x1:11,x2:12,x3:13,x4:14,x5:15,
            x6:16,x7:17,x8:18,x9:19,x10:20,
            y1:true,y2:true,y3:false,y4:false,y5:true,
            y6:true,y7:false,y8:true,y9:false,y10:true,
            z1:"f",z2:"g",z3:"h",z4:"i",z5:"j"
        };
    }
}
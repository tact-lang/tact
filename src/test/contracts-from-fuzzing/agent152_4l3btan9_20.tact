struct MegaStruct {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
    b6: Bool; b7: Bool; b8: Bool; b9: Bool; b10: Bool;
    s6: String; s7: String; s8: String; s9: String; s10: String;
    a11: Int; a12: Int; a13: Int; a14: Int; a15: Int;
    b11: Bool; b12: Bool; b13: Bool; b14: Bool; b15: Bool;
    s11: String; s12: String; s13: String; s14: String; s15: String;
}

contract TestContract {
    fat: MegaStruct;
    init() {
        self.fat = MegaStruct{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
            a6:6,a7:7,a8:8,a9:9,a10:10,
            b6:true,b7:true,b8:false,b9:false,b10:true,
            s6:"f",s7:"g",s8:"h",s9:"i",s10:"j",
            a11:11,a12:12,a13:13,a14:14,a15:15,
            b11:true,b12:true,b13:false,b14:true,b15:false,
            s11:"k",s12:"l",s13:"m",s14:"n",s15:"o"
        };
    }
}

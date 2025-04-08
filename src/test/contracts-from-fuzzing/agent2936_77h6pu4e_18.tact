struct Huge {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    b6: Bool; b7: Bool; b8: Bool; b9: Bool; b10: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    s6: String; s7: String; s8: String; s9: String; s10: String;
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: String?; o7: String?; o8: String?; o9: String?; o10: String?;
}

contract Test {
    big: Huge;

    init() {
        self.big = Huge{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            b1:true,b2:false,b3:true,b4:false,b5:true,b6:true,b7:false,b8:true,b9:false,b10:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",s6:"f",s7:"g",s8:"h",s9:"i",s10:"j",
            o1:null,o2:null,o3:null,o4:null,o5:null,
            o6:null,o7:null,o8:null,o9:null,o10:null
        };
    }
}
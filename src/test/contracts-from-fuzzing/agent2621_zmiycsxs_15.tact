struct VeryFlat {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    op1: Int?; op2: Bool?; op3: String?; op4: Int?; op5: Bool?;
}

contract Test {
    x: VeryFlat;
    init() {
        self.x = VeryFlat{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
            op1:null,op2:null,op3:null,op4:null,op5:null
        };
    }
}
// very large single struct as persistent field
struct VeryLarge {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    p1: Bool?; p2: Bool?; p3: Bool?; p4: Bool?; p5: Bool?;
    q1: String?; q2: String?; q3: String?; q4: String?; q5: String?;
}

contract HugeStructHolder {
    val: VeryLarge;

    init() {
        self.val = VeryLarge{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",
            o1:null,o2:null,o3:null,o4:null,o5:null,
            p1:null,p2:null,p3:null,p4:null,p5:null,
            q1:null,q2:null,q3:null,q4:null,q5:null
        };
    }
}
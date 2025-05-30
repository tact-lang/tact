struct Huge {
    x1: Int; x2: Int; x3: Int;
    y1: Bool; y2: Bool?; y3: Bool;
    s1: String; s2: String?; s3: String;
    z1: Int?; z2: Int; z3: Int?;
    u1: Bool; u2: Bool?; u3: Bool;
    v1: String; v2: String?; v3: String;
    w1: Int?; w2: Int; w3: Int?;
}

contract BigStructTest {
    big: Huge;

    init() {
        self.big = Huge{
            x1:1,x2:2,x3:3,
            y1:true,y2:null,y3:false,
            s1:"a",s2:null,s3:"c",
            z1:null,z2:42,z3:null,
            u1:true,u2:null,u3:false,
            v1:"x",v2:null,v3:"z",
            w1:null,w2:100,w3:null
        };
    }
}
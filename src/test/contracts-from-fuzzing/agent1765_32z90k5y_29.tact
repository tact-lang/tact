struct Huge {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    c1: Int?; c2: Int?; c3: Int?; c4: Int?; c5: Int?;
    d1: Bool?; d2: Bool?; d3: Bool?; d4: Bool?; d5: Bool?;
    e1: String; e2: String; e3: String; e4: String; e5: String;
    f1: String?; f2: String?; f3: String?; f4: String?; f5: String?;
}

contract HugeStructTest {
    s: Huge;

    init() {
        self.s = Huge{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            c1:null,c2:42,c3:null,c4:100,c5:null,
            d1:true,d2:null,d3:false,d4:null,d5:true,
            e1:"a",e2:"b",e3:"c",e4:"d",e5:"e",
            f1:null,f2:"x",f3:null,f4:"y",f5:null
        };
    }
}
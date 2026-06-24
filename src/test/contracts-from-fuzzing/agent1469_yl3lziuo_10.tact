struct Many {
    a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Bool; a6: Bool; a7: Bool; a8: Bool;
    s1: String; s2: String; s3: String; s4: String;
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?;
    x1: Int?; x2: Int?; x3: Int?; x4: Int?;
    str1: String?; str2: String?; str3: String?; str4: String?;
}

contract TestContract {
    m: Many;

    init() {
        self.m = Many{
            a1:0,a2:1,a3:2,a4:3,
            a5:true,a6:false,a7:true,a8:false,
            s1:"a",s2:"b",s3:"c",s4:"d",
            b1:null,b2:true,b3:null,b4:false,
            x1:null,x2:10,x3:null,x4:20,
            str1:null,str2:"x",str3:null,str4:"y"
        };
    }

    receive() {}
}
struct Wide {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
}

contract MegaWide {
    st: Wide;

    init() {
        self.st = Wide{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"A",s2:"B",s3:"C",s4:"D",s5:"E",
        };
    }
}
struct Big {
    x1: Int; x2: Int; x3: Int; x4: Int;
    y1: Bool; y2: Bool; y3: Bool; y4: Bool;
    s1: String; s2: String; s3: String; s4: String;
    o1: Int?; o2: Bool?; o3: String?;
}

contract ManyTypes {
    data: Big;

    init() {
        self.data = Big{
            x1:1, x2:2, x3:3, x4:4,
            y1:true, y2:false, y3:true, y4:false,
            s1:"a", s2:"b", s3:"c", s4:"d",
            o1:null, o2:null, o3:null
        };
    }
}
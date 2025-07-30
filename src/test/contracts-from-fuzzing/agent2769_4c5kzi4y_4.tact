struct BigStruct {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int;
    y1: String; y2: String;
    z1: Int?; z2: Int?; z3: Int?;
    b1: Bool; b2: Bool; b3: Bool;
    s1: String; s2: String; s3: String;
}

contract LargeFields {
    payload: BigStruct;

    init() {
        self.payload = BigStruct{
            x1:1, x2:2, x3:3, x4:4, x5:5,
            y1:"a", y2:"b",
            z1:10, z2:null, z3:30,
            b1:true, b2:false, b3:true,
            s1:"x", s2:"y", s3:"z",
        };
    }
}
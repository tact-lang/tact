struct ManyFields {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
}

contract BigStructField {
    data: ManyFields = ManyFields{
        a1: 1, a2:2, a3:3, a4:4, a5:5,
        b1:true, b2:true, b3:false, b4:true, b5:false,
        s1:"a", s2:"b", s3:"c", s4:"d", s5:"e"
    };
}
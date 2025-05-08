struct LongListFields {
    a0: Int;  a1: Int;  a2: Int;  a3: Int;  a4: Int;
    a5: Int;  a6: Int;  a7: Int;  a8: Int;  a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool;
    s0: String; s1: String; s2: String; s3: String; s4: String;
}

contract LongListTest {
    longField: LongListFields;

    init() {
        self.longField = LongListFields{
            a0:1,a1:2,a2:3,a3:4,a4:5,
            a5:6,a6:7,a7:8,a8:9,a9:10,
            b0:true,b1:false,b2:true,b3:false,b4:true,
            b5:true,b6:false,b7:true,b8:false,b9:true,
            s0:"a",s1:"b",s2:"c",s3:"d",s4:"e"
        };
    }
}

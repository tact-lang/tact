// Test a very large struct for edge case

struct L {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
    a11: Int; a12: Int; a13: Int; a14: Int; a15: Int;
    a16: Int; a17: Int; a18: Int; a19: Int; a20: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
}

contract LargeFields {
    big: L;

    init() {
        self.big = L{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            a6:6,a7:7,a8:8,a9:9,a10:10,
            a11:11,a12:12,a13:13,a14:14,a15:15,
            a16:16,a17:17,a18:18,a19:19,a20:20,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a", s2:"b", s3:"c", s4:"d", s5:"e",
        };
    }
}
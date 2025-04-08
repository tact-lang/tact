struct LargeStruct {
    a1: Int;  a2: Int;  a3: Int;  a4: Int;  a5: Int;
    a6: Int;  a7: Int;  a8: Int;  a9: Int;  a10: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
}

contract TestContract {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e"
        };
    }
}
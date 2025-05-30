struct LargeFlat {
    a: Int;a1: Int;a2: Int;a3: Int;a4: Int;a5: Int;a6: Int;a7: Int;a8: Int;a9: Int;
    b: Bool;b1: Bool;b2: Bool;b3: Bool;b4: Bool;b5: Bool;b6: Bool;b7: Bool;b8: Bool;b9: Bool;
    s: String;s1: String;s2: String;s3: String;s4: String;s5: String;s6: String;s7: String;s8: String;s9: String;
}

contract FlatMega {
    data: LargeFlat;

    init() {
        self.data = LargeFlat{
            a:1,a1:2,a2:3,a3:4,a4:5,a5:6,a6:7,a7:8,a8:9,a9:10,
            b:true,b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false,b8:true,b9:false,
            s:"a",s1:"b",s2:"c",s3:"d",s4:"e",s5:"f",s6:"g",s7:"h",s8:"i",s9:"j",
        };
    }
}

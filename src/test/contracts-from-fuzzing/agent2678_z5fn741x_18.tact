struct LongList {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool;
    s0: String; s1: String; s2: String; s3: String; s4: String;
    s5: String; s6: String; s7: String; s8: String; s9: String;
}

contract LongFieldContract {
    big: LongList;

    init() {
        self.big = LongList{
            a0:0,a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,
            b0:true,b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false,b8:true,b9:false,
            s0:"0",s1:"1",s2:"2",s3:"3",s4:"4",s5:"5",s6:"6",s7:"7",s8:"8",s9:"9"
        };
    }
}
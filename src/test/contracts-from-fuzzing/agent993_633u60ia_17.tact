struct LongStruct {
    f1:Int; f2:Int; f3:Int; f4:Int; f5:Int;
    f6:Int; f7:Int; f8:Int; f9:Int; f10:Int;
    f11:Int; f12:Int; f13:Int; f14:Int; f15:Int;
    f16:Int; f17:Int; f18:Int; f19:Int; f20:Int;
    b1:Bool; b2:Bool; b3:Bool; b4:Bool; b5:Bool;
    s1:String; s2:String; s3:String; s4:String; s5:String;
}

contract TestContract {
    big: LongStruct;

    init() {
        self.big = LongStruct{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:11,f12:12,f13:13,f14:14,f15:15,
            f16:16,f17:17,f18:18,f19:19,f20:20,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            s1:"a",s2:"b",s3:"c",s4:"d",s5:"e"
        };
    }
}
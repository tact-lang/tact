struct ExtraOrdinary {
    a: Int;
    b: Bool;
    c: String;
    d: Large;
}

struct Large {
    x1:Int; x2:Int; x3:Int; x4:Int; x5:Int;
    x6:Int; x7:Int; x8:Int; x9:Int; x10:Int;
    s:String; b:Bool; o:Int?;
}

contract MixedDeepLarge {
    s: ExtraOrdinary;

    init() {
        self.s = ExtraOrdinary {
            a: 1, b:true, c:"hi",
            d: Large{
                x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10,
                s:"big", b:false, o:null
            }
        };
    }
}
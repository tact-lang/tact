struct SLong {
    a1:Int; a2:Int; a3:Int; a4:Int; a5:Int;
    b1:Int; b2:Int; b3:Int; b4:Int; b5:Int;
    c1:Int; c2:Int; c3:Int; c4:Int; c5:Int;
    d1:Int; d2:Int; d3:Int; d4:Int; d5:Int;
    e1:Int; e2:Int; e3:Int; e4:Int; e5:Int;
}
contract LongStruct {
    s: SLong;

    init() {
        self.s = SLong{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:6,b2:7,b3:8,b4:9,b5:10,
            c1:11,c2:12,c3:13,c4:14,c5:15,
            d1:16,d2:17,d3:18,d4:19,d5:20,
            e1:21,e2:22,e3:23,e4:24,e5:25
        };
    }
}
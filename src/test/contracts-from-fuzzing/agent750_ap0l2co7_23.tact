struct Big {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int; 
    x6: Int; x7: Int; x8: Int; x9: Int; x10: Int;
    y1: Bool; y2: Bool; y3: Bool; y4: Bool; y5: Bool;
}
contract HugeStruct {
    s: Big;
    init() {
        self.s = Big{
            x1:1,x2:2,x3:3,x4:4,x5:5,
            x6:6,x7:7,x8:8,x9:9,x10:10,
            y1:true,y2:false,y3:true,y4:false,y5:true
        };
    }
}
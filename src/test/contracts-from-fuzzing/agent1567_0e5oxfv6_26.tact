struct Lengthy {
    x0: Int; x1: Int; x2: Int; x3: Int; x4: Int;
    x5: Int; x6: Int; x7: Int; x8: Int; x9: Int;
    y0: Bool; y1: Bool; y2: Bool; y3: Bool; y4: Bool;
    y5: Bool; y6: Bool; y7: Bool; y8: Bool; y9: Bool;
}

contract LongFields {
    l: Lengthy;

    init() {
        self.l = Lengthy{
            x0:1, x1:2, x2:3, x3:4, x4:5,
            x5:6, x6:7, x7:8, x8:9, x9:10,
            y0:true, y1:false, y2:true, y3:false, y4:true,
            y5:false, y6:true, y7:false, y8:true, y9:false
        };
    }
}
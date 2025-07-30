struct ManyOptionals {
    x1: Int?; x2: Int?; x3: Int?; x4: Int?; x5: Int?;
    x6: Int?; x7: Int?; x8: Int?; x9: Int?; x10: Int?;
    y1: Bool?; y2: Bool?; y3: Bool?; y4: Bool?; y5: Bool?;
    y6: Bool?; y7: Bool?; y8: Bool?; y9: Bool?; y10: Bool?;
}

contract LotsOfOptionals {
    m: ManyOptionals;
    init() {
        self.m = ManyOptionals{
            x1:null,x2:2,x3:null,x4:4,x5:null,x6:6,x7:null,x8:8,x9:null,x10:10,
            y1:true,y2:null,y3:true,y4:null,y5:true,y6:null,y7:true,y8:null,y9:true,y10:null
        };
    }
}

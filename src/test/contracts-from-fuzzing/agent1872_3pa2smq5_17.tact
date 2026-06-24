struct LotsOfOptionals {
    x1: Int?; x2: Bool?; x3: String?;
    y1: Int?; y2: Bool?; y3: String?;
    z1: Int?; z2: Bool?; z3: String?;
}

contract ManyOptionals {
    data: LotsOfOptionals;

    init() {
        self.data = LotsOfOptionals{
            x1:null,x2:null,x3:null,y1:null,y2:null,y3:null,z1:null,z2:null,z3:null
        };
    }
}
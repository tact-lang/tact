// test large struct with optional fields
struct BigOpt {
    p1: Int?; p2: Int?; p3: Int?; p4: Int?; p5: Int?;
    p6: Int?; p7: Int?; p8: Int?; p9: Int?; p10: Int?;
}

contract Test {
    b: BigOpt;

    init() {
        self.b = BigOpt{
            p1:null,p2:null,p3:null,p4:null,p5:null,
            p6:null,p7:null,p8:null,p9:null,p10:null
        };
    }
}
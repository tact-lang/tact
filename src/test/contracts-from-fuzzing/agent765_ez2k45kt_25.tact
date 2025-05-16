struct LotOpt {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
    o9: Int?;
    o10: Int?;
    o11: Int?;
    o12: Int?;
}

contract TestContract {
    bigOpt: LotOpt;

    init() {
        self.bigOpt = LotOpt{
            o1:1,o2:null,o3:3,o4:4,o5:null,
            o6:6,o7:null,o8:8,o9:9,o10:null,o11:11,o12:12 };
    }
}
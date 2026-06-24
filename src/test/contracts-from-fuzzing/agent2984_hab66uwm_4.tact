struct BoolAndOpt {
    flag1: Bool;
    optInt: Int?;
    flag2: Bool;
}

contract Test5 {
    data: BoolAndOpt;

    init() {
        self.data = BoolAndOpt{ flag1:true, optInt:null, flag2:false };
    }
}

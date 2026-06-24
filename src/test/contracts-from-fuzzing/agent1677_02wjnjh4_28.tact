struct LargeOptionalSet {
    o1:Int?;
    o2:Int?;
    o3:Int?;
    o4:Int?;
    o5:Int?;
    o6:Int?;
    o7:Int?;
    o8:Int?;
    o9:Int?;
    o10:Int?;
}

contract TestLargeOpt {
    val: LargeOptionalSet = LargeOptionalSet{
        o1:null,o2:null,o3:null,o4:null,o5:null,
        o6:null,o7:null,o8:null,o9:null,o10:null
    };

    init() {
        self.val.o5 = 1234;
    }
}

struct LargeOpt {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
    o7: Int?;
    o8: Bool?;
    o9: String?;
    o10:Int?;
}

contract LargeOptContract {
    nested: LargeOpt;

    init() {
        self.nested = LargeOpt{
            o1:null, o2:true, o3:null, o4:4, o5:false,
            o6:"hi", o7:null, o8:null, o9:"bye", o10:10
        };
    }
}
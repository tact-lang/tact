struct LargeOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;
    o6: Int?;
    o7: Bool?;
    o8: String?;
    o9: Cell?;
    o10: Address?;
}

contract LotsOfOptionals {
    s: LargeOptionals;

    init() {
        self.s = LargeOptionals{
            o1:null, o2:null, o3:null, o4:null, o5:null,
            o6:null, o7:null, o8:null, o9:null, o10:null
        };
    }
}
struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: Bool?;
    o6: Address?;
    o7: Address?;
    o8: String?;
    o9: Cell?;
    o10: Slice?;
    o11: Builder?;
}

contract LotsOptionalCtr {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1:null, o2:null, o3:null, o4:null, o5:null, o6:null, o7:null,
            o8:null, o9:null, o10:null, o11:null
        };
    }
}
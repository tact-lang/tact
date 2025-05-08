struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: Slice?;
    o6: String?;
    o7: Int?;
    o8: Bool?;
    o9: Address?;
    o10: Cell?;
    o11: Slice?;
    o12: String?;
}

contract LotsOfOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,o2:null,o3:null,o4:null,o5:null,o6:null,
            o7:null,o8:null,o9:null,o10:null,o11:null,o12:null,
        };
    }
}
struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: String?;
    o5: Cell?;
    o6: Slice?;
    o7: Int?;
    o8: Bool?;
    o9: Address?;
    o10: String?;
}

contract OptionalsStress {
    field: ManyOptionals;
    init() {
        self.field = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null,o8:null,o9:null,o10:null
        };
    }
}
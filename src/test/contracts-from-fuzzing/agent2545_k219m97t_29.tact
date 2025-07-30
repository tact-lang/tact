struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: String?;
    o5: Cell?;
    o6: Slice?;
    o7: Builder?;
}

contract OptionalsStructField {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null
        };
    }
}

struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
}

contract LotsOfOptionals {
    nested: ManyOptionals;

    init() {
        self.nested = ManyOptionals{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }
}
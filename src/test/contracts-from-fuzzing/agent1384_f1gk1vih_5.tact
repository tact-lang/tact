struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Cell?;
    o4: Slice?;
    o5: Address?;
    o6: String?;
}

contract LotsOptional {
    mopt: ManyOptionals;

    init() {
        self.mopt = ManyOptionals{
            o1: null, o2: null, o3: null, o4: null, o5: null, o6: null
        };
    }
}
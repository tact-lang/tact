struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: Int?;
    o8: String?;
    o9: Bool?;
}

contract LotsOfNulls {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            o1: null, o2: null, o3: null, o4: null, o5: null,
            o6: null, o7: null, o8: null, o9: null
        };
    }
}
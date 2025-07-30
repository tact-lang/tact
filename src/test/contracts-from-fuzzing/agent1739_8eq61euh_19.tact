struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Slice?;
    o4: Cell?;
    o5: String?;
    o6: Address?;
}

contract Test {
    stuff: ManyOptionals;

    init() {
        self.stuff = ManyOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null
        };
    }
}

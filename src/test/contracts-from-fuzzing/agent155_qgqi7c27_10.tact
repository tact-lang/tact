struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
}

contract LotsOfOptionals {
    data: ManyOpts;
    init() {
        self.data = ManyOpts{
            o1: null,
            o2: true,
            o3: null,
            o4: null,
            o5: null,
        };
    }
}
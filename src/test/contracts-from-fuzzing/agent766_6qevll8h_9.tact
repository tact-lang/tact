struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
}

contract Test {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            o1: 1,
            o2: "abc",
            o3: false,
            o4: null,
            o5: null,
            o6: null
        };
    }
}
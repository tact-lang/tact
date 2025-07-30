struct OptionNest {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Slice?;
    f6: String?;
}

contract Test5 {
    val: OptionNest;
    init() {
        self.val = OptionNest{
            f1: null, f2: null, f3: null, f4: null, f5: null, f6: null
        };
    }
}
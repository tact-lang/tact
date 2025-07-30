struct OptionalsEverywhere {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    val: OptionalsEverywhere;
    init() {
        self.val = OptionalsEverywhere {
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}
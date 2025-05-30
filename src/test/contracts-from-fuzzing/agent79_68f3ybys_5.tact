struct OptionalsEverywhere {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    opt: OptionalsEverywhere;

    init() {
        self.opt = OptionalsEverywhere{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}
struct MultiOpt {
    f1: Int?;
    f2: Bool?;
    f3: Cell?;
    f4: Address?;
    f5: String?;
}

contract TestContract {
    opt: MultiOpt;
    init() {
        self.opt = MultiOpt{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
        };
    }
}
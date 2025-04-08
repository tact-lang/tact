struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Slice?;
}

contract TestContract {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals {
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null
        };
    }
}
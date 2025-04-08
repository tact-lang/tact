struct InnerA { a: Int; }
struct InnerB { b: Bool; }
struct BothOpt {
    aOpt: InnerA?;
    bOpt: InnerB?;
}

contract OptStructTwoNested {
    storage: BothOpt?;

    init() {
        self.storage = BothOpt{
            aOpt: InnerA{ a: 12 },
            bOpt: null
        };
    }
}
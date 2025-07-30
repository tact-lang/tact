struct OptionInDeeper {
    l1: InnerOpt;
}

struct InnerOpt {
    l2: DeepestOpt?;
}

struct DeepestOpt {
    v: Int;
}

contract TestContract {
    s: OptionInDeeper;

    init() {
        self.s = OptionInDeeper{
            l1: InnerOpt{
                l2: null,
            },
        };
    }
}
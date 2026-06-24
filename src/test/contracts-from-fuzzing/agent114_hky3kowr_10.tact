struct Layer3Opt {
    s: String?;
}

struct Layer2Opt {
    l3: Layer3Opt?;
}

struct Layer1Opt {
    l2: Layer2Opt?;
}

contract DeepOptionalChain {
    nested: Layer1Opt;

    init() {
        self.nested = Layer1Opt{
            l2: null,
        };
    }
}
struct Layer3Opt {
    a: Int?;
}

struct Layer2Opt {
    l3: Layer3Opt?;
}

struct Layer1Opt {
    l2: Layer2Opt?;
}

contract NestedOptionals {
    s: Layer1Opt;
    init() {
        self.s = Layer1Opt{
            l2: null
        };
    }
}
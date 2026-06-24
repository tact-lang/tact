struct DeepOpt {
    l1: Int?;
}

struct MidOpt {
    l2: DeepOpt?;
}

struct OutOpt {
    l3: MidOpt?;
}

contract TestContract {
    nestedOpt: OutOpt;

    init() {
        self.nestedOpt = OutOpt{
            l3: null
        };
    }
}
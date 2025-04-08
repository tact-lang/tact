struct BoolNest {
    flag: Bool;
}

struct OptNest {
    nest: BoolNest?;
}

contract OptBoolChain {
    data: OptNest;
    init() {
        self.data = OptNest{ nest: null };
    }
}
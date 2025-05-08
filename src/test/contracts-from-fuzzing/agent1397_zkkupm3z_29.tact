struct DeepOpt {
    lvl1: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
}

contract NestedOptOpt {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{ lvl1: null };
    }
}
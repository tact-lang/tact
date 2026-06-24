struct InnerOptDefault {
    flag: Bool = true;
}

struct MidOpt {
    inner: InnerOptDefault? = null;
}

contract NestedOptWithDefault {
    m: MidOpt;

    init() {
        self.m = MidOpt{};
    }
}
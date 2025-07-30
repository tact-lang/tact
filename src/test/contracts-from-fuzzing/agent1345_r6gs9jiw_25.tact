struct BoolOpt {
    f1: Bool?;
}

struct MidOpt {
    inner: BoolOpt?;
}

contract NestedBoolOpt {
    content: MidOpt;

    init() {
        self.content = MidOpt{
            inner: BoolOpt{ f1: null }
        };
    }
}
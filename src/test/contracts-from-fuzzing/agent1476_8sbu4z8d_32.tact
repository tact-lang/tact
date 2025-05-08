struct DeepPrimitiveOpt {
    num: Int?;
}

struct MidOpt {
    inner: DeepPrimitiveOpt?;
}

contract TripleNestedOptional {
    root: MidOpt?;

    init() {
        self.root = null;
    }
}
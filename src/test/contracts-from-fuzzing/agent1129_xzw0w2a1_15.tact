struct InnerOpt {
    value: Int;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    mid: MiddleOpt?;
}

contract DeepMaybe {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}
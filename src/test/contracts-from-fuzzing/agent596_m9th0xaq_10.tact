struct OptionalLayer {
    maybe: InnerMost?;
}

struct InnerMost {
    val1: Int?;
    val2: Bool?;
}

contract OptNestedOpt {
    st: OptionalLayer;

    init() {
        self.st = OptionalLayer{
            maybe: InnerMost{ val1: null, val2: true }
        };
    }
}
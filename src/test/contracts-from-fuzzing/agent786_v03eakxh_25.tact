struct CompositeOpt {
    a: Int; b: Bool;
    optStr: String?;
}

struct DoubleCompositeOpt {
    c1: CompositeOpt?;
    c2: CompositeOpt?;
}

contract MultipleOptStructFields {
    cc: DoubleCompositeOpt;

    init() {
        self.cc = DoubleCompositeOpt{
            c1: null,
            c2: null
        };
    }
}
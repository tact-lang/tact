struct OptLayer {
    foo: Int?;
}

struct DoubleOpt {
    a: OptLayer?;
}

contract OptionalWrap {
    nestedOpt: DoubleOpt;

    init() {
        self.nestedOpt = DoubleOpt{
            a: null
        };
    }
}
struct InnerOpt {
    value: Int?;
    label: String?;
}

struct OuterDoubleOpt {
    in1: InnerOpt?;
    in2: InnerOpt?;
    flag: Bool;
}

contract DoubleOptionals {
    data: OuterDoubleOpt;

    init() {
        self.data = OuterDoubleOpt{
            in1: null,
            in2: null,
            flag: true
        };
    }
}
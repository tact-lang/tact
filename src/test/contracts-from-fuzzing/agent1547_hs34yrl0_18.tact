struct MultiNestedOpt {
    x: SingleOpt?;
}

struct SingleOpt {
    y: DoubleOpt?;
}

struct DoubleOpt {
    z: Int;
}

contract MultiDeepOptional {
    field: MultiNestedOpt;

    init() {
        self.field = MultiNestedOpt{
            x: SingleOpt{
                y: DoubleOpt{
                    z: 42
                }
            }
        };
    }
}
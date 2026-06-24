struct NestedOpt {
    innerOpt: Int?;
}

struct OptLayer {
    optNest: NestedOpt?;
}

contract OptOptContract {
    data: OptLayer;

    init() {
        self.data = OptLayer{
            optNest: null
        };
    }
}
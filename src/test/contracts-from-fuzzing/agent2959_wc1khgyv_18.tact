struct OptNumBool {
    x: Int?;
    y: Bool?;
}

struct OptOpt {
    nested: OptNumBool?;
}

contract NestedOptionLayer {
    data: OptOpt;

    init() {
        self.data = OptOpt{nested: null};
    }
}
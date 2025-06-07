struct OptionalNest {
    inner: InnerS?;
}

struct InnerS {
    value: Int?;
}

contract Test45 {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{inner: null};
    }
}
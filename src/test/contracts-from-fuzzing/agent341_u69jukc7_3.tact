struct OptionalNest {
    opt: Inner?;
}

struct Inner {
    x: Int;
    s: String?;
}

contract TestContract {
    field: OptionalNest;

    init() {
        self.field = OptionalNest{
            opt: Inner{ x: 5, s: null },
        };
    }
}
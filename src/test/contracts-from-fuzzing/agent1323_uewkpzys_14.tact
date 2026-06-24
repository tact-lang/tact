struct OptionalNest {
    a: Int?;
    nested: OptionalSub?;
}

struct OptionalSub {
    s: String?;
}

contract NestedOptionalsStructs {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            a:null,
            nested:null
        };
    }
}

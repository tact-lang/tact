struct OptAndNest {
    val: Int;
    opt: Bool?;
    nested: Nested;
}

struct Nested {
    s: String;
    innerOpt: Int?;
}

contract TestContract {
    field: OptAndNest;

    init() {
        self.field = OptAndNest{
            val: 1,
            opt: null,
            nested: Nested{ s: "hi", innerOpt: null }
        };
    }
}

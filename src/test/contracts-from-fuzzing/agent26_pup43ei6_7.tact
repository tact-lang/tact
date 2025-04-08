struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    label: String;
}

contract Test7 {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            innerOpt: Inner{
                val: 10,
                label: "nested",
            },
        };
    }
}
struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    val: Int?;
    flag: Bool?;
}

contract OptionalDeep {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt: Inner{
                val: null,
                flag: null,
            },
        };
    }
}

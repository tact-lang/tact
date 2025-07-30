struct OptionalNest {
    s1: Inner?;
}

struct Inner {
    val: Int?;
    flag: Bool;
}

contract TestOptional {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            s1: Inner{ val: null, flag: true }
        };
    }
}
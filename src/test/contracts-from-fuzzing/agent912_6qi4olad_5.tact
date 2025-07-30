struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    val: Int = 5;
}

contract OptionalNestTest {
    field: OptionalNest;

    init() {
        self.field = OptionalNest{ innerOpt: null };
    }
}
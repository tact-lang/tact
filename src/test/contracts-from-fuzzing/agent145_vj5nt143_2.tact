struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt: Inner{
                val: 7,
                flag: true,
            }
        };
    }
}

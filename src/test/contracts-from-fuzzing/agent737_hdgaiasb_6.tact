struct OptionalNest {
    optInner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            optInner: Inner{
                val: 42
            }
        };
    }
}

struct OptionalNest {
    val1: Int?;
    val2: Bool?;
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalNestedStruct {
    param: OptionalNest;

    init() {
        self.param = OptionalNest{
            val1: null,
            val2: true,
            inner: null
        };
    }
}
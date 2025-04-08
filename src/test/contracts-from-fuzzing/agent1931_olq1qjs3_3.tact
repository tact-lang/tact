struct OptionalNest {
    field1: Int?;
    field2: Bool?;
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptNested {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            field1: null,
            field2: true,
            inner: Inner{val: 7}
        };
    }
}
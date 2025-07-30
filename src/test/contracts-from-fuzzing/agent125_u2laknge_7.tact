struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract WithOptNest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: Inner{ value: 555 },
        };
    }
}
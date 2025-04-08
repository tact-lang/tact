struct OptionalNest {
    inner: OptionalInner?;
}

struct OptionalInner {
    value: Int?;
}

contract TestContract {
    field: OptionalNest;

    init() {
        self.field = OptionalNest{ inner: OptionalInner{ value: null } };
    }
}